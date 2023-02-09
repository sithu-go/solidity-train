// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract StrangePureView{
    uint public strangeStorageVariable;


    // view function can access the variable outside of the scope of function.
    // view function cannot write.
    function getStrangeStorageVaraible() public view returns(uint) {
        return strangeStorageVariable;
    }

    // pure function only can access the parameters of the function
    // both functions cost nothing, but you still need gas because they burn some gas
    // but you won't pay anyone to mine a transaction.
    // It can only access its own arguments and other pure functions
    function getAddition (uint a, uint b) public pure returns(uint) {
        return a+b;// execution cost
    }

    // this function writing to the blockchain, so the transaction cost will occur

    // it is a bad idea to return variable.
    // return variable are only meant for inter contract communication
    // so when contract a calls contract b and there is a return variable, then this can work.
    // if you work on a real blockchain, we use events for that
    // writing function usually don't have return variables. it's only meant for other smart contracts.
    function setStrangeStorageVariable(uint _newVar) public returns (uint) {
        strangeStorageVariable = _newVar;
        return _newVar;
    }
}

// execution cost
// transaction cost