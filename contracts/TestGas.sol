//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract TestGas {
    uint256[3] public votes;

    uint256[3] public banlist;

    event VoteCast(bytes message);
    event VoteMessage(string message);

    // uint size = 3;

    function deleteArrV1() public {
        // delete is more efficient (less use gas) than
        // delete votes;
        // votes[0] = 1;
        // // votes = new uint[](0);
        // for (uint i = 0; i < 3; i++) {
        //     votes[i] = 0;
        // }

        // banlist = [uint(1), 2, 3];

        emit VoteMessage("Before Voting");

        banlist = [2, 3, 3];

        emit VoteCast(bytes("log 3"));

        // uint[] memory a = new uint[](size);
        // bytes memory b = new bytes(size);

        // votes[votes.length] = 1;
    }
}
