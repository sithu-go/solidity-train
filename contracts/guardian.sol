// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract Consumer {
    function deposit() public payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract GuardianContract {
    address payable public owner;

    struct GuardianInfo {
        bool isGuardian;
        uint256 balance;
    }

    uint256 public maxGuardians = 5;
    uint256 public currentGuardians;
    mapping(address => GuardianInfo) public guardians;

    address payable public newOwner;
    uint256 public votesForNewOwner;
    address[] public votedGuardians;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function geTotalBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function sendMoney(
        uint256 _amount,
        address payable _to,
        bytes memory _payload
    ) public returns (bytes memory) {
        require(
            _amount <= address(this).balance &&
                (msg.sender == owner ||
                    (guardians[msg.sender].isGuardian &&
                        guardians[msg.sender].balance >= _amount)),
            "You have to be owner"
        );
        (bool success, bytes memory returnData) = _to.call{value: _amount}(
            _payload
        );
        require(success);
        return returnData;
    }

    function addGuardain(address _guardian) public {
        require(
            msg.sender == owner && currentGuardians < maxGuardians,
            "You needs to be owner. and can't be exceed than maximum guardian"
        );
        currentGuardians++;
        guardians[_guardian].isGuardian = true;
    }

    function removeGuardian(address _guardian) public {
        require(
            msg.sender == owner && guardians[_guardian].isGuardian,
            "You must be the owner and you can only remove existed guardian"
        );
        currentGuardians--;
        guardians[_guardian] = GuardianInfo(false, 0);
    }

    function giveAllowance(address _guardian, uint256 _amount) public {
        require(
            msg.sender == owner &&
                guardians[_guardian].isGuardian &&
                _amount <= address(this).balance,
            "You needs to be owner or must give one of the guardains and contract balance must be greater than amount"
        );
        guardians[_guardian].balance = _amount;
    }

    function proposeNewOwner(address payable _newOwner) public {
        require(
            guardians[msg.sender].isGuardian && _newOwner != address(0),
            "You needs to be guardian to vote"
        );
        // not inficient way to validate but easy to reuse array by deleting
        // mapping might be efficient way to validate but can't reuse
        // how about (mapping(address => address), can be used for different owner, but can't revote previous owner.
        // what about array of struct []Structk
        for (uint256 i = 0; i < votedGuardians.length; i++) {
            require(votedGuardians[i] != msg.sender, "You already voted, duh!");
        }
        votedGuardians.push(msg.sender);
        if (newOwner != address(0)) {
            if (newOwner != _newOwner) {
                votesForNewOwner = 0;
            }
        }
        newOwner = _newOwner;
        votesForNewOwner++;
        if ((votesForNewOwner * 100) / maxGuardians > 50) {
            owner = newOwner;
            newOwner = payable(address(0));
            votesForNewOwner = 0;
            delete votedGuardians;
        }
    }
}
