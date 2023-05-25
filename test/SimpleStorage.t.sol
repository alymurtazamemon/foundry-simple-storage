// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SimpleStorage.sol";

contract CounterTest is Test {
    SimpleStorage public simpleStorage;

    function setUp() external {
        simpleStorage = new SimpleStorage();
    }

    function test_InitialValues() external {
        assertEq(simpleStorage.retrieve(), 0);
    }

    function test_store() external {
        simpleStorage.store(40);
        assertEq(simpleStorage.retrieve(), 40);
    }

    function test_addPerson() external {
        simpleStorage.addPerson("Ali Murtaza", 786);
        (uint256 number, string memory name) = simpleStorage.people(0);
        assertEq(number, 786);
        assertEq(name, "Ali Murtaza");
    }
}
