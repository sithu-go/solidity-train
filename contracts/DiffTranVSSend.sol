// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract Sender {
    receive() external payable{}

    function withdrawTransfer(address payable _to) public {
        // send and transfer provide 2300 gas
        _to.transfer(10); // if transaction fails, it will throw an exception
    }

    function withdrawSend(address payable _to) public {
        // send function is low level interaction with smart contract
        // it doesn't care about what happeing on the other side
        // all it cares about is, it's going to send this away.
        bool sentSuccessful = _to.send(10); // if transaction fails, it will return false
        require(sentSuccessful, "Sending the fund is unsuccessful.");
        
    }
}

contract ReceiverNoAction {
    function balance() public view returns (uint) {
        return address(this).balance;
    }

    receive() external payable{}
}

contract ReceiverAction {
    uint public balanceReceived;

    function balance() public view returns (uint) {
        return address(this).balance;
    }

    receive () external payable {
        balanceReceived += msg.value;
    }
}