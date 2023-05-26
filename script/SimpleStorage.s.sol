// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/SimpleStorage.sol";
import "forge-std/console.sol";

contract SimpleStorageScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // * deploy the contract
        SimpleStorage simpleStorage = new SimpleStorage();

        // * get the initial number
        uint256 number = simpleStorage.retrieve();
        console.log("Initial Favorite Number: ", number);

        // * store the number
        simpleStorage.store(786);

        // * get the updated number
        number = simpleStorage.retrieve();
        console.log("Updated Favorite Number: ", number);
        vm.stopBroadcast();
    }
}
