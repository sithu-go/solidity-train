// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract StrangeWrapAround {
    uint8 public strangeUint;

    function decrementStrangeUint() public {
        // when u decrement if value is 0, it will go to 
        // 115792089237316195423570985008687907853269984665640564039457584007913129639935
        unchecked {
            strangeUint--;
        }
    }

}
