// SPDX-License-Identifier: BUSL-1.1

pragma solidity ^0.8.0;

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

interface IERC20WithFaucet is IERC20, IERC20Metadata {
    error FaucetOnCooldown();

    function faucet() external;

    function faucetAmount() external view returns (uint256);

    function faucetCooldown() external view returns (uint256);

    function faucetTimer(address account) external view returns (uint256);
}
