// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script} from "forge-std/Script.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
import {console} from "forge-std/console.sol";

contract DeployNFT is Script {
    function run() external returns (BasicNFT) {
        vm.startBroadcast();
        BasicNFT basicNFT = new BasicNFT();
        vm.stopBroadcast();
        console.log("BasicNFT deployed to: ", address(basicNFT));
        return basicNFT;
    }
}
