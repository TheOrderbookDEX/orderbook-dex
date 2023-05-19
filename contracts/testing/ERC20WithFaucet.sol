// SPDX-License-Identifier: BUSL-1.1

pragma solidity 0.8.20;

import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { ERC20Burnable } from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import { IERC20WithFaucet } from "./interfaces/IERC20WithFaucet.sol";

contract ERC20WithFaucet is ERC20, ERC20Burnable, IERC20WithFaucet {
    uint8 immutable _decimals;

    uint256 immutable _faucetAmount;

    uint256 immutable _faucetCooldown;

    mapping(address => uint256) _faucetTimer;

    constructor(
        string memory name, string memory symbol, uint8 decimals_, uint256 faucetAmount_, uint256 faucetCooldown_
    )
        ERC20(name, symbol)
    {
        _decimals = decimals_;
        _faucetAmount = faucetAmount_;
        _faucetCooldown = faucetCooldown_;
    }

    function decimals() override (ERC20, IERC20Metadata) public view returns (uint8) {
        return _decimals;
    }

    function faucet() external {
        if (block.timestamp < _faucetTimer[msg.sender]) {
            revert FaucetOnCooldown();
        }
        _faucetTimer[msg.sender] = block.timestamp + _faucetCooldown;
        _mint(msg.sender, _faucetAmount);
    }

    function faucetAmount() external view returns (uint256) {
        return _faucetAmount;
    }

    function faucetCooldown() external view returns (uint256) {
        return _faucetCooldown;
    }

    function faucetTimer(address account) external view returns (uint256) {
        return _faucetTimer[account];
    }
}
