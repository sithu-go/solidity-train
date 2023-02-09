// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract MappingWithdrawals {
    mapping(address => uint) public balanceReceived;

    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function getBalance() public view returns (uint){
        return address(this).balance;
    }

    // function withdrawAll(address payable _to) public {
    //     _to.transfer(getBalance());
    // }

    // Prevent Re-Entrancy and Checks-Effects-Interaction Pattern
    function withdrawMoney (address payable _to, uint _amount) public {
        require(balanceReceived[msg.sender] >= _amount, "not enough fund");

        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);

        // uint balanceSendOut = balanceReceived[msg.sender];
        // balanceReceived[msg.sender] = 0;
        // _to.transfer(balanceSendOut);

        // _to.transfer(balanceReceived[msg.sender]);
        // balanceReceived[msg.sender] = 0;
    }

}