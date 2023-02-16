// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract MultiHolder {
    address public owner;

    uint8 public maxMembers = 5;
    uint8 public countMembers;

    mapping(address => bool) public members;

    address public newOwner;
    uint8 public votesForNewOwner;

    // address[] public votesToTransfer;
    uint8 public votesToTransfer;
    uint public amount;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendMoney(uint256 _amount, address payable _toAddress) public {
        require(address(this).balance >= _amount && _amount > 0);
        if (msg.sender == owner) {
            _toAddress.transfer(_amount);
        } else if (members[msg.sender]) {
            // if not initial state
            if (amount != 0) {
                if (amount != _amount) {
                    // votesToTransfer = new address[](0);
                    // delete votesToTransfer;
                    votesToTransfer = 0;
                }

            }

            amount = _amount;
            // votesToTransfer.push(msg.sender);
            votesToTransfer++;
            if (votesToTransfer*100 / maxMembers > 50) {
                // delete votesToTransfer;
                votesToTransfer = 0;
                amount = 0;
                _toAddress.transfer(_amount);
            }
        }
    }

    function proposeNewOwner(address proposedOwner) public {
        require(members[msg.sender] && proposedOwner > address(0));
        if (newOwner != proposedOwner) {
            votesForNewOwner = 0;
        }
        newOwner = proposedOwner;
        votesForNewOwner++;
        if (votesForNewOwner*100 / maxMembers > 50) {
            newOwner = address(0);
            owner = newOwner;
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

}
