// Deploy mocks whne we are on a local anvil chain
// Keep track of contract address across different chains
// Sepolia ETH / USD Address
// Mainnet ETH / USD Address

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {Script} from "forge-std/Script.sol";
// import "forge-std/console.sol";

contract HelperConfig {
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address priceFeed; // ETH/USD price feed address
    }

    constructor() {
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSepoliaEthConfig();
        } else {
            activeNetworkConfig = getAnvilEthConfig();
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        // price feed address
        return sepoliaConfig;
    }

    function getAnvilEthConfig() public pure returns (NetworkConfig memory) {}
}
