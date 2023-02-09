// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract StrangeMsgSender {
    address public strangeAddress;


    function updateSenderAddress() public {
        strangeAddress = msg.sender;
    }
}

    // Acc -> Contract(of sender)
    // msg sender = acc

    // Acc -> Contract 1 -> Contract 2 (of sender)
    // contract 2 of sender = contract 1 account
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4