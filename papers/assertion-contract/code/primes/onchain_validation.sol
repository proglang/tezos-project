// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "./on_off_chain_assertion.sol";
import "./onchain_primes.sol";

/**
 * On-chain Assertion contract incentives for validating a prime number
 */
contract OnChainAssertion {

    /**
    * Conterexamples
    * r : the random number
    */
    struct Counterexp {
        uint r;
    }

    /**
    * Computation proofs
    * v_addr : validator addresss
    * num : the random number to generating a seed
    */
    struct Proof {
        address v_addr; 
        uint nonce; 
    }

    /**
    * Parameters
    * p_hash : parameter hash
    * proof : list of proofs
    * counterexample : a counterexample is found
    * timestamp : approximate time when the parameter is submitted
    * balance : balance funded by the caller
    * flag : if flag is true, parameter is avaible for checking, otherwise 
    */
    struct Parameter {
        uint p_hash; 
        Proof[] proof; 
        Counterexp counterexample; 
        uint timestamp; 
        uint balance; 
        bool flag; 
    }

    address public owner; // contract owner
    Primes public workContract; // on-chain work contract
 
    mapping (address => Parameter) public parameters; // parameters
    uint[] counterexample; //counterexample

    uint diff = 1;
    uint target = 2 ** (256 - diff); 

    uint award_counterexp = 5;
    uint award_proof = 2;

    uint num_prf = 2;
    uint min_deb = 7;
    uint timeout = 1000;

    uint pass_val = 0;
    uint gas_val = 1;

    constructor() {
        owner = msg.sender; 
    }

    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    function setWorkContract(Primes addr) public isOwner {
        workContract = addr;
    }

    function nonExistingProof(address c_addr, address v_addr) private view returns (bool) {
        bool result = true;
        for (uint i = 0; i < parameters[c_addr].proof.length; i++) {
            if (parameters[c_addr].proof[i].v_addr == v_addr) {
            result = false;
             break;
            } 
        }
        return result;
    }

    function submit(uint p) public payable {
        require(msg.value >= min_deb, "Insufficient deposit.");
        require(parameters[msg.sender].flag == false, "Another parameter is active.");
        parameters[msg.sender].p_hash = uint (keccak256(abi.encodePacked(p)));
        parameters[msg.sender].counterexample = Counterexp({ r : 0 });
        parameters[msg.sender].timestamp = block.timestamp;
        parameters[msg.sender].balance = msg.value;
        parameters[msg.sender].flag = true;
    }

    function validate(address c_addr, uint p, uint nonce) public {
        require(parameters[c_addr].flag == true, "Inactive parameter.");
        require(parameters[c_addr].p_hash == uint (keccak256(abi.encodePacked(p))), "Invalid parameter.");
    
        Validator v = new Validator();
        uint seed = uint (keccak256(abi.encodePacked(msg.sender, c_addr, p, nonce)));
        uint cal = v.validate(p, seed);
        if (cal == 2) { 
            uint b_val = parameters[c_addr].balance - award_counterexp; 
            parameters[c_addr].counterexample = Counterexp({r : p});
            parameters[c_addr].balance = 0;
            parameters[c_addr].flag = false; 
            counterexample.push(p);
            delete parameters[c_addr]; 
            payable(msg.sender).transfer(award_counterexp); 
            payable(c_addr).transfer(b_val); 
        }
        else
        {
            require(cal == 1, "Invalid proof.");
            require(nonExistingProof(c_addr, msg.sender), "Existing proof.");
            parameters[c_addr].proof.push(Proof({v_addr : msg.sender, nonce : nonce}));
            parameters[c_addr].balance -= award_proof;

            if (parameters[c_addr].proof.length == num_prf) {
                uint b_val = parameters[c_addr].balance - pass_val - gas_val;
                parameters[c_addr].balance = 0;
                parameters[c_addr].flag = false; 
                delete parameters[c_addr];
                workContract.declare{value: pass_val, gas: 1000000}(c_addr, p); // call the work contract 
                payable(c_addr).transfer(b_val); 
            } 
        payable(msg.sender).transfer(award_proof);
        }
    }

    function releaseParameter() public {
        require((block.timestamp - parameters[msg.sender].timestamp) > timeout , "Invalid time.");
        require(parameters[msg.sender].flag, "Inactive parameter.");
        uint b_val = parameters[msg.sender].balance;
        parameters[msg.sender].flag = false;
        delete parameters[msg.sender];
        payable(msg.sender).transfer(b_val);
    }
}
