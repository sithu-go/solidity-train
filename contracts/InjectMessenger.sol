// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract InjectMessenger{
    string public message;

    function changeMessage(string memory _msg) public{
        message = _msg;
    }
}