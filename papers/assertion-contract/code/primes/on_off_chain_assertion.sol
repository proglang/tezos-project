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

    function validate(uint a, uint seed) 
    public view returns (uint) {
        uint range = a / 2 - 2; 
        uint r = seed % range + 2;
        uint cal = a % r;
        bool p = (cal == 0);
        

        uint result = 0; // an non-award computational proof 
        if (p)  
            result = 2; // a counterexample
        else 
            {
                uint result_target = 
                    uint (keccak256(abi.encodePacked(seed, cal)));
                if (result_target <= target) 
                    result = 1; // a computational proof    
            }
        return result;           
    }
}
