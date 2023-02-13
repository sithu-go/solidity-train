// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract WillThrow {
    // function aFunction() public pure {
    //     require(false, "moh sein lar error always panic");
    // }

    // custom exceptions are defined at the beginning of a smart contract
    // error ThisIsACustomError (string, string);
    // web3.utils.sha3("NotAllowedError(string)") == b94e62a1
    error NotAllowedError(string);
    function aFunction() public pure {
        // require(false, "moh sein lar error always panic");
        // revert ThisIsACustomError("Text 1", "text message 2");
        // assert(false);
        revert NotAllowedError("You are not allowed");
    }
}

contract ErrorHandling {
    event ErrorLogging (string reason);
    event ErrorCode (uint errcode);
    event ErrorLogBytes (bytes lowLevelData);
    function catchError() public {
        WillThrow will = new WillThrow();
        try will.aFunction() {
            // here we could do something if it works
        } catch Error (string memory reason) {  // require and revert
            emit ErrorLogging(reason);
        } catch Panic (uint errCode) {  // panic only works for assert
            emit ErrorCode(errCode);
        } catch (bytes memory lowLevelData) { // for custom error
            emit ErrorLogBytes(lowLevelData);
        }
    }
}