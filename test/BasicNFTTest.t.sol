// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
import {DeployNFT} from "../script/DeployNFT.s.sol";

contract BasicNFTTest is Test {
    BasicNFT public basicNFT; // The contract we are testing
    DeployNFT public deployNFT; // The script that deploys the contract

    function setUp() public {
        deployNFT = new DeployNFT();
        basicNFT = deployNFT.run();
    }

    /***
     * @dev This test checks if the name of the NFT contract is correct.
     * It compares the name of the contract with the expected name "Dogie".
     */
    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = basicNFT.name();
        assertEq(actualName, expectedName);
    }
}
