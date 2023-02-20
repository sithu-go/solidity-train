// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Test {
    address public owner;
    uint[] public arr;

    mapping(address => bool)[] public votedGuardians;
    mapping(address => bool) vote;

    // struct VotedInfo {
    //     address voter;

    // }
    // []

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

    function proposeNewOwner() public {
        if (votedGuardians.length == 0) {
            vote[msg.sender] = true;
            votedGuardians.push();
        }
        votedGuardians[0][msg.sender] = true;
    }

    function renewMap() public {
        delete votedGuardians;
    }

    function checkVote() public view returns(bool) {
        return votedGuardians[0][msg.sender];
    }
}
