// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNFT is ERC721 {
    uint256 private s_tokenCounter;
    string private s_sadSVGImageURI;
    string private s_happySVGImageURI;

    enum Mood {
        SAD,
        HAPPY
    }

    mapping(uint256 => Mood) private s_tokenIdToMood;

    constructor(
        string memory _sadSVGImageURI,
        string memory _happySVGImageURI
    ) ERC721("Mood NFT", "MN") {
        s_tokenCounter = 0;
        s_sadSVGImageURI = _sadSVGImageURI;
        s_happySVGImageURI = _happySVGImageURI;
        s_tokenIdToMood[s_tokenCounter] = Mood.HAPPY;
    }

    function mintNFT() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function _baseURI() internal view override returns (string memory) {
        return "data:application/json;base64,";
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        string memory imageURI;

        if (s_tokenIdToMood[tokenId] == Mood.SAD) {
            imageURI = s_sadSVGImageURI;
        } else {
            imageURI = s_happySVGImageURI;
        }

        return
            string(
                abi.encodePacked(
                    _baseURI(),
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name": "',
                                name(),
                                '", "description": "Mood NFT", "attributes": [{"trait_type": "mood", "value": "100"}], "image": "',
                                imageURI,
                                '"}'
                            )
                        )
                    )
                )
            );
    }
}
