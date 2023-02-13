// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract StrangeString {
    string public strangeString = "Hello Strange";
    // bytes public strangeBytes = "Hello Laing";
    bytes public strangeBytes = unicode"Hello Wörld";

    // refrence types need memory location
    // refrence types = string, 
    function setStrangeString (string memory _strangeString) public {
        strangeString = _strangeString;
    }

    // now we are comparing hashes of the strings
    function compareTwoStrings(string memory _strangeString) public view returns(bool) {
        return keccak256(abi.encodePacked(strangeString)) == keccak256(abi.encodePacked(_strangeString));
    }

    function getBytesLength() public view returns(uint) {
        return strangeBytes.length;
    }
}