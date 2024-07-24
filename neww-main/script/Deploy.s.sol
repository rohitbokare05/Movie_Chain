//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
//import {HelperConfig} from "./HelperConfig.sol";
import {Manager} from "src/contract.sol";

contract DeployManager is Script {
    function run() external returns (Manager) {
        // HelperConfig helperConfig = new HelperConfig();
        vm.startBroadcast();
        Manager manager = new Manager();
        vm.stopBroadcast();

        return manager;
    }
}
