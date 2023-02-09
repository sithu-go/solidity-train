// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract StrangeMapping {
    mapping(uint => bool) public strangeMapping;
    mapping(address => bool) public addressMapping;
    mapping(uint => mapping(uint => bool)) uintUintBoolMapping;

    function setValue(uint _index) public {
        strangeMapping[_index] = true;
    }

    function setMyAddressToTrue() public {
        addressMapping[msg.sender] = true;
    }

    function getUintUintBoolMapping (uint _key1, uint _key2) public view returns (bool) {
        return uintUintBoolMapping[_key1][_key2];
    }

    function setUintUintBoolMapping (uint _key1, uint _key2) public {
        uintUintBoolMapping[_key1][_key2] = true;
    }
}