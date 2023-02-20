(async () => {
    let abiArray = [
        {
            "inputs": [],
            "name": "myUint",
            "outputs": [
                {
                    "internalType": "uint256",
                    "name": "",
                    "type": "uint256"
                }
            ],
            "stateMutability": "view",
            "type": "function"
        },
        {
            "inputs": [
                {
                    "internalType": "uint256",
                    "name": "_myUint",
                    "type": "uint256"
                }
            ],
            "name": "setMyUint",
            "outputs": [],
            "stateMutability": "nonpayable",
            "type": "function"
        }
    ]

    let contractAddress = "0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B"

    const contractInstance = new web3.eth.Contract(abiArray, contractAddress)
    console.log(await contractInstance.methods.myUint().call());

    let accounts = await web3.eth.getAccounts();
    let txResult = await contractInstance.methods.setMyUint(444).send({from: accounts[0], gas: 24000});
    console.log(txResult)
    console.log(await contractInstance.methods.myUint().call())
})()