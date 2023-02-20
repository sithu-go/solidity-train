// (async () => {
//     console.log('HEHE')
//     let accounts = await web3.eth.getAccounts()
//     console.log(accounts)
//     console.log('HAHa', accounts.length)

//     let balance = await web3.eth.getBalance(accounts[0])
//     console.log(balance)

//     let ethv = await web3.utils.fromWei(balance, 'ether')
//     console.log(ethv)
// })()

(async() => {
    let accounts = await web3.eth.getAccounts()
    console.log(accounts, accounts.length)

    let balance = await web3.eth.getBalance(accounts[0])
    console.log(balance)

    ethBalance = web3.utils.fromWei(balance, "ether")
    console.log(ethBalance)
})()
