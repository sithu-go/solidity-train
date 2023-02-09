// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExceptionAssert {
    mapping(address => uint8) public payments;

    function depositMoney() public payable {
        assert(msg.value == uint8(msg.value));
        payments[msg.sender] += uint8(msg.value);
        assert(payments[msg.sender] >= msg.value);
    }

    function withdrawMoney (address payable _to, uint8 _amount) public {
        require(_amount <= payments[msg.sender], "Not Enough Funds, aborting");
        assert(payments[msg.sender] >= payments[msg.sender] - _amount);
        payments[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}