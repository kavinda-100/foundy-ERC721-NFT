// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
import {DeployNFT} from "../script/DeployNFT.s.sol";

contract BasicNFTTest is Test {
    BasicNFT public basicNFT; // The contract we are testing
    DeployNFT public deployNFT; // The script that deploys the contract
    address public USER = makeAddr("user"); // The address of the user
    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json"; // The token URI for the NFT

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

    /***
     * @dev This test checks tes can mint an NFT and have a balance of 1.
     * It mints an NFT with the PUG URI and checks if the user has a balance of 1.
     */
    function testCanMintAndHaveBalance() public {
        vm.startPrank(USER);
        basicNFT.mintNFT(PUG); // Mint the NFT with the PUG URI

        assertEq(basicNFT.balanceOf(USER), 1); // Check if the user has a balance of 1 NFT
        assertEq(
            keccak256(abi.encodePacked(basicNFT.tokenURI(0))),
            keccak256(abi.encodePacked(PUG))
        ); // Check if the token URI is correct
    }
}
