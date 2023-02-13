// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract StrangeAddress {
    // address type store 20 bytes worth of an Ethereum address or Ethereum Account
    address public strangeAddress;

    function setStrangeAddress(address _strangeAddress) public {
        strangeAddress = _strangeAddress;
    }

    // 1 ETH = 10^18 wei
    // wei is the smallest denomination on the Ethereum blockchain
    // denominations
    // https://ethereum-blockchain-developer.com/2022-02-solidity-basics-blockchain-messenger/05-ethereum-addresses/
    function getAddressBalance() public view returns(uint) {
        return strangeAddress.balance;
    }
}
