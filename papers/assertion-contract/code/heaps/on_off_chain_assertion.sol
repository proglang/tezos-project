// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * Validator Contract
 * Check a counterexample/computational proof
 */
contract Validator{

    /**
    * The difficulty for a computational proof
    */
    uint diff = 1;
    uint public target = 2 ** (256 - diff); 

    /**
    * Check a counterexample/ computational proof
    * The result from a validator
    * 0 = non-award, 1 = proof, 2 = counterexample
    */

    function validate(uint[10] memory a, uint seed) 
    public view returns (uint) {
        uint range = a.length; 
        uint k = seed % range + 1;

        uint cal_1 = a[k];
        uint cal_2 = a[(k - 1) / 2];
        
        bool p = (cal_1 < cal_2);

        uint result = 0; // an non-award computational proof 
        if (p)  
            result = 2; // a counterexample
        else {
            uint result_target = 
                uint (keccak256(abi.encodePacked(seed, cal_1, cal_2)));
            if (result_target <= target) 
                result = 1; // a computational proof      
        }              
        return result;           
    }
}

