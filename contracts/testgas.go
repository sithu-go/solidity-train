package main

import (
	"context"
	"fmt"
	"math/big"

	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/ethclient"
)

func main() {
	client, err := ethclient.Dial("https://mainnet.infura.io")
	if err != nil {
		fmt.Println("Error connecting to Ethereum network:", err)
		return
	}

	contractAddress := common.HexToAddress("0x...")
	instance, err := NewTestGas(contractAddress, client)
	if err != nil {
		fmt.Println("Error instantiating contract:", err)
		return
	}

	votes, err := instance.Votes(nil, [3]*big.Int{})
	if err != nil {
		fmt.Println("Error getting votes:", err)
		return
	}

	fmt.Println("Votes:", votes)

	banlist, err := instance.Banlist(nil, [3]*big.Int{})
	if err != nil {
		fmt.Println("Error getting banlist:", err)
		return
	}

	fmt.Println("Banlist:", banlist)

	err = instance.DeleteArrV1(nil)
	if err != nil {
		fmt.Println("Error deleting array:", err)
		return
	}
}
