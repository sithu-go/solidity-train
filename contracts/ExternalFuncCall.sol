// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract ContractOne {
    mapping(address => uint) public addressBalances;

    function deposit() public payable {
        addressBalances[msg.sender] += msg.value;
    }

    receive () external payable {
        deposit();
    }
}

contract ContractTwo {
    receive () external payable {}

    function depositOnContractOne(address _contractOne) public {
        // ContractOne one = ContractOne(_contractOne);
        // one.deposit{value: 10, gas: 20300}();
        // send and transfer provide 2300 gas
        // but if we know our smart contract do something, we should provide more
    }
}

contract ABIContractTwo {
    receive () external payable {}

    function depositOnContractOne(address _contractOne) public {
        // low level call
        // bytes memory payload = abi.encodeWithSignature("deposit()");
        // // there are two return values: one is transaction status and two is return value
        // // above function we don' t have return value
        // (bool success, )= _contractOne.call{value: 10, gas: 20300}(payload);
        // require(success);

        // it will enter to fallback (receive)
        (bool success, ) = _contractOne.call{value: 10, gas: 20300}("");
        require(success);
    }
}