// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract RetrainContract {

    function aFuntion() public pure {
        require(false, "Error message");
    }
}

contract ErrorHandling {
    event ErrorLogging(string reason);
    function catchError () public {
        RetrainContract will = new RetrainContract();
        try will.aFuntion() {

        } catch Error (string memory reason) {
            emit ErrorLogging(reason);
        }
    }
}