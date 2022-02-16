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

    function validate(uint[] memory p, uint seed)
    public view returns (uint) {
        uint range_1 = p.length - 1; 
        require(range_1 > 0, "invalid range");
        uint n = seed_i % range_1 + 1;
        uint range_2 = n;
        require(range_2 > 0, "invalid range");
        uint m = seed_j % range_2 ;
        
        uint cal_1 = p[m];
        uint cal_2 = p[n];

        uint result = 0; // an unaward computation proof 
        if (cal_1 > cal_2)  result = 2; // a counterexample
        else 
            {
            uint result_target = uint (keccak256(abi.encodePacked(seed, cal_1, cal_2)));
            if (result_target <= target) result = 1; // a computation proof      
        }             
        return result;           
    }
}
