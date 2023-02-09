// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract ExceptionRequire {
    mapping(address => uint) public payments;

    function depositMoney() public payable {
        payments[msg.sender] += msg.value;
    }

    // function withdrawMoney(address payable _to, uint _amount) public {
    //     if(_amount <= payments[msg.sender]) {
    //         payments[msg.sender] -= _amount;
    //         _to.transfer(_amount);
    //     }
    // }

    function withdrawalMoney(uint _amount) public payable {
        // if (payments[msg.sender] >= _amount) {
        require(payments[msg.sender] >= _amount, "Insufficient Balenciaga, bebe");
        payments[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }
}