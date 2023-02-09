//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract Consumer {
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function deposit() public payable {}
}

contract SmartContractWalletV2 {
    address payable owner;

    struct AllowanceInfo {
        uint256 amount;
        bool isAllow;
    }

    mapping(address => AllowanceInfo) public allowances;

    mapping(address => bool) public guardians;

    address payable public nextOwner;

    uint256 public guardiansResetCount;

    // mapping(address => mapping(address => bool)) nextOwnerGuardianVotes;

    address[] public votes;

    constructor() {
        owner = payable(msg.sender);
    }

    event VoteCast(bytes message);

    function proposeNewOwner(address _newOwner) public {
        require(guardians[msg.sender], "You are not guardian, aborting");
        for (uint256 i = 0; i < votes.length; i++) {
            require(votes[i] != _newOwner, "You have already voted");
        }

        if (_newOwner != nextOwner) {
            nextOwner = payable(_newOwner);
            guardiansResetCount = 0;
            // delete is more efficient (less use gas) than
            votes = new address[](0);
        }

        // you cannot push to fixed-sized array.
        guardiansResetCount++;
        votes.push(msg.sender);

        if (guardiansResetCount >= 3) {
            owner = nextOwner;
            // reset nextOwner and resetCount
            nextOwner = payable(address(0));
            guardiansResetCount = 0;
            votes = new address[](0);
            emit VoteCast(bytes("log 3"));
        }
    }

    function setGuardian(address _guardian, bool _isGuardian) public {
        require(msg.sender == owner, "You are not the owner, aborting!");
        guardians[_guardian] = _isGuardian;
    }

    function setAllowance(address _for, uint256 _amount) public {
        require(msg.sender == owner, "You are not the owner, aborting!");

        if (_amount > 0) {
            allowances[_for] = AllowanceInfo(_amount, true);
        } else {
            allowances[_for] = AllowanceInfo(_amount, false);
        }
    }

    function transfer(
        address _to,
        uint256 _amount,
        bytes memory _payload
    ) public returns (bytes memory) {
        if (msg.sender != owner) {
            require(
                allowances[msg.sender].isAllow,
                "You are not allowed to send anything from this smart contract"
            );
            require(
                allowances[msg.sender].amount >= _amount,
                "you are trying to send more than you are allowed to"
            );
        }
        // web3.utils.sha3('""') or 0x2392a8
        // for EOA (External Owned Account) AND A contract which have fallback and receive() external payable {}
        (bool success, bytes memory returnData) = _to.call{value: _amount}(
            _payload
        );

        require(success, "Aborting, call was not successful");

        return returnData;
    }

    receive() external payable {}
}
