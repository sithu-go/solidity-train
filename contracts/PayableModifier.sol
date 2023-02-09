// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract PayableContract {
    string public strangeString = "Hello Strange";
    function changeString(string memory _string) public payable {
        if (msg.value == 1 ether) {
            strangeString = _string;
        } else {
            // casting modifier
            payable(msg.sender).transfer(msg.value);

        }
    }
}