// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.15;

import {Script} from 'forge-std/Script.sol';
import {AWGrimoireOfOptimism} from "src/AWGrimoireOfOptimism.sol";

contract Deploy is Script {
  function run() external returns (AWGrimoireOfOptimism awGrimoireOfOptimism) {
    vm.startBroadcast();
    awGrimoireOfOptimism = new AWGrimoireOfOptimism();
    vm.stopBroadcast();
  }
}
