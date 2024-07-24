// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "lib/forge-std/src/Script.sol";
import {Manager} from "src/stadium2.sol";

contract Deploy is Script {
    function run() external {
        vm.startBroadcast();

        new Manager();

        vm.stopBroadcast();
    }
}
