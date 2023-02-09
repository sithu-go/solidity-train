// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract StrangeAddress {
    address public strangeAddress;

    function setStrangeAddress(address _strangeAddress) public {
        strangeAddress = _strangeAddress;
    }

    // 1 ETH = 10^18 wei
    // wei is the smallest denomination on the Ethereum blockchain
    function getAddressBalance() public view returns(uint) {
        return strangeAddress.balance;
    }
}
