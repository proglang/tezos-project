// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * On/off-chain assertion contract 
 * to check counterexamples/computational proofs
 */
contract Validator{

    /**
    * The difficulty for a computational proof
    */
    uint diff = 1;
    uint public target = 2 ** (256 - diff); 

    /**
    * The result: 0 = non-award, 1 = proof, 2 = counterexample
    */

    function validate(uint a, uint b, uint seed)
    public view returns (uint) {
        uint range;
        if (a >= b) { range = a - 2; }
        else {range = b - 2;}
        
        uint r = seed % range + 2;
        require(range != 0, "invalid range");

        uint cal_1 = a % r;
        uint cal_2 = b % r;
        
        bool p = (cal_1 == 0) && (cal_2 == 0);

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

