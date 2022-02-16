// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "./onchain_validation.sol";

/**
 * On-chain Primes contract incentives for finding prime number
 */
contract Primes {

    address public owner; // contract owner
    OnChainAssertion public onChainAssertion; // on-chain assertion contract

    mapping (address => uint) public funders; // funders to the contract
    mapping (uint => address) public primes; // prime numbers found

    uint public prize = 20; // prize for each found prime number

    constructor() {
        owner = msg.sender; 
    }

    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    function setParentContract(OnChainAssertion addr) public isOwner {
        onChainAssertion = addr;
    }

    function fund() payable public {
        funders[msg.sender] += msg.value;
    }

    function declare(address c_addr, uint p) payable public {
        require(msg.sender == address (onChainAssertion), "Invalid caller!");
        require(primes[p] == address(0), "Prime number is already found!");
        primes[p] = c_addr;
        payable(c_addr).transfer(prize);
    }
}

