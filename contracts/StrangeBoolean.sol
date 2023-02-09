// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract StrangeBoolean {
    bool public strangeBool;

    function setStrangeBool(bool _strangebool) public {
        strangeBool = true == !_strangebool;
    }
}