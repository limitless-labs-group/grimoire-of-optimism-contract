// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.15;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import { AWGrimoireOfOptimism } from "src/AWGrimoireOfOptimism.sol";
import { Merkle } from "murky/Merkle.sol";

contract AWGrimoireOfOptimismTest is Test {
    AWGrimoireOfOptimism awGrimoireOfOptimism;

    address constant MaxSchnaider = 0xb1D7daD6baEF98df97bD2d3Fb7540c08886e0299;
    address constant AtlantisWorld = 0x036C545Ae4f68059b4C83f7E3814429d4c73c089;

    function setUp() public {
        awGrimoireOfOptimism = new AWGrimoireOfOptimism();
    }

    function testOwnable() public {
        vm.expectRevert(bytes("AWGrimoireOfOptimism: who da fuck r u?"));
        awGrimoireOfOptimism.airdrop(MaxSchnaider);
    }

    function testAirdrop() public {
        vm.prank(AtlantisWorld);
        awGrimoireOfOptimism.airdrop(MaxSchnaider);
        assertEq(awGrimoireOfOptimism.balanceOf(MaxSchnaider), 1);
        assertEq(awGrimoireOfOptimism.isAirdropped(), true);
    }

    function testTokenURI() public {
        assertEq(awGrimoireOfOptimism.tokenURI(1), awGrimoireOfOptimism.baseURI());
    }
}