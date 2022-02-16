// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * Validator Contract
 * Check a counterexample/computation proof
 */
contract Validator{

    /**
    * The difficulty for a computation proof
    */
    uint diff = 1;
    uint public target = 2 ** (256 - diff); 

    /**
    * Check a counterexample/ computation proof
    * The result from a validator
    * 0 = unaward, 1 = proof, 2 = counterexample
    */

    function validate(uint[10] memory p, uint seed) public view returns (uint) {
        uint range = p.length; 
        uint k = seed % range + 1;

        uint cal_1 = p[k];
        uint cal_2 = p[(k - 1) / 2];

        uint result = 0; // an unaward computation proof 
        if (cal_1 < cal_2)  result = 2; // a counterexample
        else {
            uint result_target = uint (keccak256(abi.encodePacked(seed, cal_1, cal_2)));
            if (result_target <= target) result = 1; // a computation proof      
        }              
        return result;           
    }
}
