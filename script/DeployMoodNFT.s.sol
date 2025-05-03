// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script} from "forge-std/Script.sol";
import {MoodNFT} from "../src/MoodNFT.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {console2} from "forge-std/console2.sol";

contract DeployMoodNFT is Script {
    MoodNFT public moodNFT;

    function run() external returns (MoodNFT) {
        string memory sadSvg = vm.readFile("./img/sad.svg");
        string memory happySvg = vm.readFile("./img/happy.svg");

        vm.startBroadcast();
        // encode the SVG images to base64 format before passing them to the constructor
        moodNFT = new MoodNFT(svgToImageURI(sadSvg), svgToImageURI(happySvg));
        vm.stopBroadcast();

        return moodNFT;
    }

    function svgToImageURI(
        string memory svg
    ) public pure returns (string memory) {
        string memory baseURI = "data:image/svg+xml;base64,";
        string memory base64EncodedSvg = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );
        return string(abi.encodePacked(baseURI, base64EncodedSvg));
    }
}
