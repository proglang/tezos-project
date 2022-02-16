// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "./on_off_chain_assertion.sol";
/**
 * Off-chain primes assertion contract
 * Try to find a counterexample or a computation proof
 */
contract PrimesOffChainAssertion {

    /**
    * The result from a computation
    * nonce : the random number for generating the seed 
    * award : 0 = unaward, 1 = proof, 2 = counterexample
    */
    struct Result {
        uint nonce;
        uint award; 
    }

    Result public result;
    
    /**
    * Set up the lower and upper bound for the validation process
    */

    uint lower_bound = 0;
    uint upper_bound = 30;
    /**

    /**
    * Try to find a counterexample or a computation proof
    */
    function find_nonce(address v_addr, address c_addr, uint p) public { 
        uint nonce = lower_bound;
        result = Result({nonce : nonce, award : 0});
        Validator v = new Validator();

        while (nonce < upper_bound) { 
            uint seed = uint (keccak256(abi.encodePacked(v_addr, c_addr, p, nonce)));
            uint cal = v.validate(p, seed);
            if (cal == 2) {   
                result = Result({nonce : nonce, award : 2 }); // a counterexample is found
                break;
            }
            else {
                if (cal == 1) {
                    result = Result({nonce : nonce, award : 1 }); // a computaion proof is found
                    // break;    // depend on a validator decision                                      
                }                        
            } 
            nonce++;         
        }              
    }
}
