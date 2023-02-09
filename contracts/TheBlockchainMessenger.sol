// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract TheBlockChainMessenger {
    uint public counter;

    address owner;

    string public theMessage;

    constructor (address _owner) {
        owner = _owner;
    }
    function updateTheMessage (string memory _message) public {
        if (msg.sender == owner) {
            theMessage = _message;
            counter++;
        }
    }   
}