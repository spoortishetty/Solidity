//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract Variables{

    //state variables
    string public greet = "Hello World";
    uint public num = 123;
    uint public timestamp;
    address public caller;

    function demoFunction(uint value) public {

        //local variable
        num = value;

        //global variables
        timestamp = block.timestamp;
        caller = msg.sender;

    }

    function getNum() public view returns(uint) {
        return num;

    }

    function addNums(uint num1, uint num2) public pure returns(uint){
        return num1+num2;
    }
}