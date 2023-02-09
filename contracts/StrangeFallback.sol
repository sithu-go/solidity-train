// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract StrangeFallback {
    uint public lastValueSent;
    string public lastFunctionCalled;
    uint public strangeUint;

    // 0xa8db5372000000000000000000000000000000000000000000000000000000000000000c
    // Ox means hex value
    // four bytes (a8db5372) 8 characters are function signature

    // when you retrieve hex value of function with web3.utils.sha3("setStrangeUint(uint256)")
    // 0xa8db5372052efa2901e81f090e228824b84e3c9dee557354d5beeb4a4420dd2c
    // look at the first four bytes, you will see (a8db5372), that's the function identifier.

    function setStrangeUint(uint _strangeNewUint) public {
        strangeUint = _strangeNewUint;
    }

    receive() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
    }

    fallback() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }

    // if you have both receive and fallback functions
    // if send value with no data, it will call to receive function.
    // if send value with data, it will call to fallback funtion.

    // if you have only fallback function, it will call to fallback function.
    // if you have only receive function, it will only send eth with no data.
}