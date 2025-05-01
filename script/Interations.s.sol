// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BasicNFT} from "../src/BasicNFT.sol";
import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

contract MintBasicNFT is Script {
    function run() external {}

    function mintNFT(address basicNFT, string memory tokenUri) public {
        (bool success, ) = basicNFT.call(
            abi.encodeWithSignature("mintNFT(string)", tokenUri)
        );
        require(success, "Minting failed");
    }
}
