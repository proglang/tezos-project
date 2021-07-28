// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
// compiles on remix.ethereum.org
contract CheckPrime {

    //  fixed part
    address payable owner;
    bytes32 target;
    uint256 fund;
    bool active;
    // variable part, the type may be different for each assertion
    uint candidate_prime;

    constructor(uint _candidate_prime) payable {
        require (msg.value >= 0.2 ether, "insufficient rewards");
        owner = payable(msg.sender);
        candidate_prime = _candidate_prime;
        // the target depends on the difficulty of the assertion, so it should probably be a parameter
        target = bytes32(type(uint256).max >> 3);
        fund = msg.value;
        active = true;
    }

    function offChain(uint rand) public view returns (bool isCounterexample, bytes32 _hashValue) {
        bytes32 hashValue = keccak256(abi.encodePacked(msg.sender, rand));
        // variable part starts here
        // we want proof that this calculation is done:
        uint potential_divisor = rand % (candidate_prime / 2) + 2;
        isCounterexample = candidate_prime % potential_divisor == 0;
        // update of hashValue is inserted automatically
        _hashValue = hashValue;
    }

    // amounts for rewards also depend on the difficulty -> also parameters of the constructor
    function onChain(uint rand) public {
        bool isCounterexample;
        bytes32 hashValue;
        (isCounterexample, hashValue) = offChain(rand);
        // rewards
        if (active && hashValue < target) {
            fund -= 14_640_983 gwei;
            payable(msg.sender).transfer(14_640_983 gwei);
        }
        if (active && isCounterexample) {
            fund -= 18_645_939 gwei;
            payable(msg.sender).transfer(18_645_939 gwei);
            active = false;
            // deactivate
            owner.transfer(address(this).balance);
            fund = 0;
        }
    }
}
