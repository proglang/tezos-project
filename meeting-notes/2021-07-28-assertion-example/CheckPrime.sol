// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;
contract CheckPrime {

    //  fixed part
    address payable owner;
    bytes32 target;
    uint amount_work_required;
    uint amount_work_done;
    mapping (address => bool) already_submitted;
    uint256 fund;
    bool active;
    bool proved;
    // variable part, the type may be different for each assertion
    uint candidate_prime;

    constructor(uint _candidate_prime) payable {
        require (msg.value >= 0.2 ether, "insufficient rewards");
        owner = payable(msg.sender);
        candidate_prime = _candidate_prime;
        // the target depends on the difficulty of the assertion, so it should probably be a parameter
        target = bytes32(type(uint256).max >> 3);
        amount_work_required = 16; // also a parameter?
        amount_work_done = 0;
        fund = msg.value;
        active = true;
        proved = false;
    }
    
    function mcg(uint seed) private pure returns (uint next_seed) {
        return (seed * 0xca9634b976f622d450b386f6ec5fa0a5 + 0xdeadf00ddeadf00d) % type(uint128).max;
    }

    function offChain(uint seed, uint nr_checks) public view returns (bool isCounterexample, bytes32 _hashValue) {
        bytes32 hashValue = keccak256(abi.encodePacked(tx.origin, seed));
        // variable part starts here
        // we want proof that this calculation is done:
        isCounterexample = false;
        for(uint i = 0; !isCounterexample && i < nr_checks; i++) {
            uint potential_divisor = seed % (candidate_prime / 2) + 2;
            isCounterexample = candidate_prime % potential_divisor == 0;
            seed = mcg(seed);
        }
        // update of hashValue is inserted automatically
        _hashValue = hashValue;
    }

    // amounts for rewards also depend on the difficulty -> also parameters of the constructor
    function onChain(uint rand, uint nr_checks) public {
        require (!already_submitted[msg.sender]);
        bool isCounterexample;
        bytes32 hashValue;
        already_submitted[msg.sender] = true;
        amount_work_done++;
        (isCounterexample, hashValue) = offChain(rand, nr_checks);
        // rewards
        if (active && isCounterexample) {
            fund -= 18_645_939 gwei;
            payable(msg.sender).transfer(18_645_939 gwei);
            active = false;
            // deactivate
            owner.transfer(address(this).balance);
            fund = 0;
        } else if (active && hashValue < target) {
            fund -= 14_640_983 gwei;
            payable(msg.sender).transfer(14_640_983 gwei);
            if (amount_work_done >= amount_work_required) {
                active = false;
                proved = true;
                // deactivate
                owner.transfer(address(this).balance);
                fund = 0;
            }
        }
    }
    
    // the actual work is done in this function
    function invert(uint a) public view returns (uint t) {
        require (proved && a < candidate_prime);
        // do something that requires a prime number!
        t = 0;
        uint new_t = 1;
        uint r = candidate_prime;
        uint new_r = a;
        while (new_r != 0) {
            uint q = r / new_r;
            (t, new_t) = (new_t, t - q * new_t);
            (r, new_r) = (new_r, r - q * new_r);
        }
    }
}
