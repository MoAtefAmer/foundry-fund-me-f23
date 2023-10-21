// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe}  from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    uint number = 1;
    FundMe fundMe; // hello

    function setUp() external {
        // fundMe = new FundMe();
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
    }

    function testMinDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public{

        assertEq(fundMe.i_owner(), msg.sender);
    }

    function testPriceFeedVersion() public {
        assertEq(fundMe.getVersion(), 4);
    }



}
