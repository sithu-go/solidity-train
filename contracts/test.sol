// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Test {
    address public owner;
    uint[] public arr;

    constructor() {
        owner = msg.sender;
    }

    function setZeroAddress() public {
        owner = address(0);
    }

    function checkIsZeroAddress() public view returns (bool) {
        return owner == address(0);
    }

    function deleteArray() public {
        delete arr;
    }

    function pushArray() public {
        arr.push(5);
    }
}
