// SPDX-License-Identifier: BUSL-1.1

pragma solidity 0.8.17;

/**
 * An ERC20 token wrapper that allows non standard tokens to be used in an orderbook.
 *
 * By non standard tokens we mean tokens that do not follow these rules:
 *
 *   - An account balance should only change as a result of an operation requested or
 *     authorized by the account owner.
 *
 *   - The amount of tokens transfered should not be different that the amount of
 *     requested to be transfered.
 *
 * I.e. tokens that tax on transfer and rebasing tokens are considered non standard.
 */
contract ERC20Wrapper {
    // TODO ERC20Wrapper contract
}
