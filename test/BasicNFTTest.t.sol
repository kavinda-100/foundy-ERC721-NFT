// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
import {DeployNFT} from "../script/DeployNFT.s.sol";

contract BasicNFTTest is Test {
    BasicNFT public basicNFT;
    DeployNFT public deployNFT;

    function setUp() public {
        deployNFT = new DeployNFT();
        basicNFT = deployNFT.run();
    }
}
