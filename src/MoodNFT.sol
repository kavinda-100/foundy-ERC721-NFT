// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MoodNFT is ERC721 {
    uint256 private s_tokenCounter;
    string private s_sadSVG;
    string private s_happySVG;

    constructor(
        string memory _sadSVG,
        string memory _happySVG
    ) ERC721("Mood NFT", "MN") {
        s_tokenCounter = 0;
        s_sadSVG = _sadSVG;
        s_happySVG = _happySVG;
    }

    function mintNFT() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {}
}
