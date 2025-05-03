// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";
import {console2} from "forge-std/console2.sol";
import {MoodNFT} from "../../src/MoodNFT.sol";
import {DeployMoodNFT} from "../../script/DeployMoodNFT.s.sol";

contract MoodNFTIntegrationTest is Test {
    MoodNFT private moodNFT;
    DeployMoodNFT private deployMoodNFT;

    address USER = makeAddr("user");

    function setUp() public {
        deployMoodNFT = new DeployMoodNFT();
        moodNFT = deployMoodNFT.run();
    }

    function testViewTokenURI() public {
        vm.startPrank(USER);
        moodNFT.mintNFT();
        string memory tokenURI = moodNFT.tokenURI(0);
        console2.log(tokenURI);
        // assertEq(moodNFT.s_tokenCounter(), 1);
        vm.stopPrank();
    }
}
