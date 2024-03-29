// SPDX-License-Identifier: BUSL-1.1

pragma solidity 0.8.20;

import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { ERC20Burnable } from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import { IERC20Mock, AccountAndAmount } from "./interfaces/IERC20Mock.sol";

contract ERC20Mock is ERC20, ERC20Burnable, IERC20Mock {
    uint8 immutable _decimals;

    constructor(string memory name, string memory symbol, uint8 decimals_)
        ERC20(name, symbol)
    {
        _decimals = decimals_;
    }

    function decimals() override (ERC20, IERC20Metadata) public view returns (uint8) {
        return _decimals;
    }

    function give(address recipient, uint256 amount) external {
        _mint(recipient, amount);
    }

    function giveMe(uint256 amount) external {
        _mint(_msgSender(), amount);
    }

    function giveMultiple(AccountAndAmount[] calldata amounts) external {
        for (uint256 i; i < amounts.length; i++) {
            _mint(amounts[i].account, amounts[i].amount);
        }
    }
}
