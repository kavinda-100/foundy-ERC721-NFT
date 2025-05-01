// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    uint256 private s_tokenCounter;

    constructor() ERC721("Dogie", "DOG") {
        s_tokenCounter = 0;
    }

    function mintNFT() public {}

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return
            string(
                abi.encodePacked(
                    "https://example.com/api/token/",
                    Strings.toString(tokenId)
                )
            );
    }
}
