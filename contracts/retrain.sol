// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract RetrainContract {
    uint public myUint;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
}