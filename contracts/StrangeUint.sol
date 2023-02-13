// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract StrangeUint {
    // uint is a alias for uint256 : can store (0 - (2^256)-1)

    // below line cost more gas in deploy stage
    // uint public strangeUint = 0;

    uint public strangeUint;

    uint8 public strangeUint8 = 250;

    int public strangeInt = -10; // -2^128 to 2^128-1

    function setStrangeUint (uint _strangeUint) public {
        strangeUint = _strangeUint;
    }

    function incrementStrangeUint8() public {
        strangeUint8++;
    }

    function incrementInt() public {
        strangeInt++;
    }

    function decrementStrangeUInt() public {
        strangeUint--;
    }
}