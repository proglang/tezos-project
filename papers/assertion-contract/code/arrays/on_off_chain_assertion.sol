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

    function validate(uint[] memory a, uint seed)
    public view returns (uint) {
        uint range_1 = a.length - 1; 
        require(range_1 > 0, "invalid range");
        uint n = seed % range_1 + 1;
        uint range_2 = n;
        require(range_2 > 0, "invalid range");
        uint seed_1 = uint (keccak256(abi.encodePacked(seed, n)));
        uint m = seed_1 % range_2 ;
        
        uint cal_1 = a[m];
        uint cal_2 = a[n];
        
        bool p = (cal_1 > cal_2);

        uint result = 0; // an non-award computational proof 
        if (p)  
            result = 2; // a counterexample
        else 
            {
            uint result_target = 
                uint (keccak256(abi.encodePacked(seed, cal_1, cal_2)));
            if (result_target <= target) 
                result = 1; // a computational proof      
        }             
        return result;           
    }
}
