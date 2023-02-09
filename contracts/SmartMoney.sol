// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract SmartMoney {
    uint public balanceReceived;

    function deposit() public payable {
        balanceReceived += msg.value;
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    // transfer to address which calls to this contract
    function withdrawAll() public {
        address payable to = payable(msg.sender);
        to.transfer(getContractBalance());
    }

    // transfer to address which specified
    function withdrawToAddress(address payable to) public {
        to.transfer(getContractBalance());
    }
}