// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract StrangeConstructor {
    address public strangeAddress;

    // we can use constructor, to set the variable when deployment
    // it is only called once, it cannot call aftewards.
    constructor (address _strangeAddress) {
        strangeAddress = _strangeAddress;
    }
    // constructor () {
    //     strangeAddress = msg.sender;
    // }

    function setStrangeAddress(address _strangeAddress) public {
        strangeAddress = _strangeAddress;
    }

    function setAddressToMsgSender() public {
        strangeAddress = msg.sender;
    }
}

// 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2