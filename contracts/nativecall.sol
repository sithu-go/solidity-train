// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

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

    receive() external payable{}

    function depositOnContractOne (address _contractOne) public {
        // ContractOne one = ContractOne(_contractOne);
        // one.deposit{value: address(this).balance, gas: 100000}(); // native transfer
        
        // what if we don't have ContractOne in the code and other people's and we only know function name
        // this is how you call any kind of smart contract.
        bytes memory payload = abi.encodeWithSignature("deposit()");
        (bool success,) = _contractOne.call{value: 10, gas: 100000}(payload);
        require(success);


        // what if we don't know which functions have
        // low level call
        // (bool success, ) = _contractOne.call{value: 10, gas: 100000}("");
        // require(success);

    }
}