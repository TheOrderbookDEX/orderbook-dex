// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.15;

import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

struct AccountAndAmount {
    address account;
    uint256 amount;
}

interface IERC20Mock is IERC20Metadata {
    function give(address recipient, uint256 amount) external;

    function giveMe(uint256 amount) external;

    function giveMultiple(AccountAndAmount[] memory amounts) external;
}
