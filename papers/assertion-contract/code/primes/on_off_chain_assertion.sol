// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * On/off-chain assertion contract 
 * to check counterexamples/computation proofs
 */
contract Validator{

    /**
    * The difficulty for a computation proof
    */
    uint diff = 1;
    uint public target = 2 ** (256 - diff); 

    /**
    * The result: 0 = unaward, 1 = proof, 2 = counterexample
    */

    function validate(uint p, uint seed) public view returns (uint) {
        uint range = p / 2 - 2; 
        uint r = seed % range + 2;
        uint cal = p % r;

        uint result = 0; // an unaward computation proof 
        if (cal == 0)  result = 2; // a counterexample
        else 
            {
                uint result_target = uint (keccak256(abi.encodePacked(seed, cal)));
                if (result_target <= target) result = 1; // a computation proof    
            }                     
        return result;           
    }
}
