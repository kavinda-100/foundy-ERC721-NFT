// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MoodNFT is ERC721 {
    uint256 private s_tokenCounter;
    string private s_sadSVGImageURI;
    string private s_happySVGImageURI;

    constructor(
        string memory _sadSVGImageURI,
        string memory _happySVGImageURI
    ) ERC721("Mood NFT", "MN") {
        s_tokenCounter = 0;
        s_sadSVGImageURI = _sadSVGImageURI;
        s_happySVGImageURI = _happySVGImageURI;
    }

    function mintNFT() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {}
}
