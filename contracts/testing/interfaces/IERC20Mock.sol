// SPDX-License-Identifier: BUSL-1.1

pragma solidity ^0.8.0;

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

interface IERC20Mock is IERC20, IERC20Metadata {
    function give(address recipient, uint256 amount) external;

    function giveMe(uint256 amount) external;

    function giveMultiple(AccountAndAmount[] memory amounts) external;
}

struct AccountAndAmount {
    address account;
    uint256 amount;
}
