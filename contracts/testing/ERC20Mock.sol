// SPDX-License-Identifier: BUSL-1.1

pragma solidity 0.8.17;

import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { ERC20PresetFixedSupply } from "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetFixedSupply.sol";
import { IERC20Mock, AccountAndAmount } from "./interfaces/IERC20Mock.sol";

contract ERC20Mock is ERC20PresetFixedSupply, IERC20Mock {
    uint8 immutable _decimals;

    constructor(string memory name, string memory symbol, uint8 decimals_)
        ERC20PresetFixedSupply(
            name,
            symbol,
            type(uint256).max,
            address(this)
        )
    {
        _decimals = decimals_;
    }

    function decimals() override (ERC20, IERC20Metadata) public view returns (uint8) {
        return _decimals;
    }

    function give(address recipient, uint256 amount) external {
        _transfer(address(this), recipient, amount);
    }

    function giveMe(uint256 amount) external {
        _transfer(address(this), _msgSender(), amount);
    }

    function giveMultiple(AccountAndAmount[] calldata amounts) external {
        for (uint256 i; i < amounts.length; i++) {
            _transfer(address(this), amounts[i].account, amounts[i].amount);
        }
    }
}
