// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract StrangeContract {
    string public strangeString = "Hello Strange, I'm feeel sleepy!";

    function updateStrangeString(string memory updatedString) public {
        strangeString = updatedString;
    }
}