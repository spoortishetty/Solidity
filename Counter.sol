//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract Counter {
    uint public count;

    // increase the value of count
    function increaseCount() public {
        count = count + 1;
    }

    //decrease the value of count
    function decreaseount() public {
        count = count - 1;
        count -= 1;
    }

}