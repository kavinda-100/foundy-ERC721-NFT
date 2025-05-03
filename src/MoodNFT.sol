// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNFT is ERC721 {
    uint256 private s_tokenCounter; // Counter for the number of NFTs minted
    string private s_sadSVGImageURI; // URI for the sad SVG image
    string private s_happySVGImageURI; // URI for the happy SVG image

    /**
     * @dev Enum representing the mood of the NFT. The mood can be either SAD or HAPPY.
     * The enum is used to categorize the mood of the NFT and is stored in a mapping.
     */
    enum Mood {
        SAD,
        HAPPY
    }

    /***
     * @dev Mapping from token ID to mood. The mapping is private and can only be accessed through the contract's functions.
     * The mapping is used to store the mood of each NFT based on its token ID.
     */
    mapping(uint256 => Mood) private s_tokenIdToMood;

    /***
     * @dev Constructor function that initializes the contract with the sad and happy SVG image URIs.
     * The constructor also sets the initial mood of the first NFT to HAPPY.
     */
    constructor(
        string memory _sadSVGImageURI,
        string memory _happySVGImageURI
    ) ERC721("Mood NFT", "MN") {
        s_tokenCounter = 0;
        s_sadSVGImageURI = _sadSVGImageURI;
        s_happySVGImageURI = _happySVGImageURI;
        s_tokenIdToMood[s_tokenCounter] = Mood.HAPPY;
    }

    /**
     *  @dev This function allows the owner of the NFT to set the mood of the NFT.
     */
    function mintNFT() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    /***
     * @dev This function allows set the Url Pattern of the NFT.
     */
    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    /***
     * @dev This function allows the owner of the NFT to set the mood of the NFT.
     * @param tokenId The ID of the NFT whose mood is to be set
     */
    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        string memory imageURI; // Variable to hold the image URI based on the mood

        // change the image URI based on the mood of the NFT
        if (s_tokenIdToMood[tokenId] == Mood.SAD) {
            imageURI = s_sadSVGImageURI;
        } else {
            imageURI = s_happySVGImageURI;
        }

        // Return the token URI in JSON format, including the name, description, attributes, and image URI
        // The token URI is encoded in Base64 format for efficient storage and transmission
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
