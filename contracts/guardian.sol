// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract GuardianContract {
    address public owner;

    struct GuardianInfo {
        bool isGuardian;
        uint balance;
    }

    uint public maxGuardians = 5;
    uint public currentGuardians;
    mapping(address => GuardianInfo) public guardians;

    address public newOwner;
    uint public votesForNewOwner;

    constructor () {
        owner = msg.sender;
    }

    receive() external payable {

    }

    function geTotalBalance () public view returns(uint) {
        return address(this).balance;
    }

    function sendMoney(uint _amount, address payable _to) public {
        require(_amount <= address(this).balance && (msg.sender == owner || (guardians[msg.sender].isGuardian && guardians[msg.sender].balance >= _amount)), "You have to be owner");
        _to.transfer(_amount);
    }

    function addGuardain(address _guardian) public {
        require(msg.sender == owner && currentGuardians < maxGuardians, "You needs to be owner. and can't be exceed than maximum guardian");
        currentGuardians++;
        guardians[_guardian].isGuardian =  true;
    }

    function giveAllowance(address _guardian,uint _amount) public {
        require(msg.sender == owner && guardians[_guardian].isGuardian && _amount <= address(this).balance, "You needs to be owner or must give one of the guardains and contract balance must be greater than amount");
        guardians[_guardian].balance = _amount;
    }

    function proposeNewOwner(address _newOwner) public {
        require(guardians[msg.sender].isGuardian && _newOwner != address(0), "You needs to be guardian to vote");
        if (newOwner != address(0)){
            if (newOwner != _newOwner) {
                votesForNewOwner = 0;
            }
        }
        newOwner = _newOwner;
        votesForNewOwner++;
        if (votesForNewOwner*100 / maxGuardians > 50) {
            owner = newOwner;
            newOwner = address(0);
            votesForNewOwner = 0;
        }
    }

}
