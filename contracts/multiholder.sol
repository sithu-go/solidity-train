// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract MultiHolder {
    address public owner;

    uint8 public maxMembers = 5;
    uint8 public countMembers;

    mapping(address => bool) public members;
    address[] public votesAddM;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendMoney(uint256 _amount, address payable _toAddress) public {
        require(address(this).balance >= _amount);
        if (msg.sender == owner) {
            _toAddress.transfer(_amount);
        }
    }

    function addMember(address _member) public {
        if (msg.sender == owner) {
            require(!members[_member] && countMembers < maxMembers);
            countMembers++;
            members[_member] = true;
        }
    }

    function removeMember(address _member) public {
        if (msg.sender == owner) {
            require(members[_member]);
            countMembers--;
            members[_member] = false;
        }
    }

    // function voteToAddMember(address _member) public {
    //     if (members[msg.sender]) {
    //         votesAddM.push(msg.sender);
    //     }
    // }
}
