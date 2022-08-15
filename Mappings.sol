//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract Mappings {
    mapping(address => uint) public balances;

    function addBalance(uint value) public {
        balances[msg.sender] = value;
    }
}