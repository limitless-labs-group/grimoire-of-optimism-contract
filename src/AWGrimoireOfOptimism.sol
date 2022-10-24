// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.15;

/**
 * ▄▀█ ▀█▀ █░░ ▄▀█ █▄░█ ▀█▀ █ █▀   █░█░█ █▀█ █▀█ █░░ █▀▄
 * █▀█ ░█░ █▄▄ █▀█ █░▀█ ░█░ █ ▄█   ▀▄▀▄▀ █▄█ █▀▄ █▄▄ █▄▀
 *
 * Atlantis World is building the Web3 social metaverse by connecting Web3 with social, 
 * gaming and education in one lightweight virtual world that's accessible to everybody.
 */

import { ERC721 } from "solmate/tokens/ERC721.sol";

contract AWGrimoireOfOptimism is ERC721 {

    string public constant baseURI = "ipfs://bafkreiebyr2uj63d56u6x54pg3fqo5jr5cq7ynwaihncsu24q2b7egoiwa";
    bool public isAirdropped = false;
    address public constant owner = 0x036C545Ae4f68059b4C83f7E3814429d4c73c089;  // atlantisworld.eth

    constructor() ERC721("Atlantis World Grimoire Of Optimism", "AWGOP") {}

    modifier onlyOwner() {
        require(msg.sender == owner, "AWGrimoireOfOptimism: who da fuck r u?");
        _;
    }

    modifier singleCopy() {
        require(!isAirdropped, "AWGrimoireOfOptimism: 1/1 NFT is already minted");
        _;
    }

    function airdrop(address to) external onlyOwner singleCopy {
        isAirdropped = true;
        _safeMint(to, 1);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        return baseURI;
    }
}