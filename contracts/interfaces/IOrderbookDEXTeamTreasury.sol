// SPDX-License-Identifier: BUSL-1.1

pragma solidity ^0.8.0;

/**
 * Orderbook DEX Team Treasury.
 */
interface IOrderbookDEXTeamTreasury {
    /**
     * The current fee applied to orderbooks of a specific version.
     *
     * The fee is returned as a fixed point decimal value with 18 decimal digits in base 10 (same as ETH).
     *
     * This function should not use more than 10,000 gas. Failing to do so will be interpreted as the fee being 0.
     *
     * This function should not revert. Failing to do so will be interpreted as the fee being 0.
     *
     * The should not be higher than a prespecified value (TBD), if it is higher the actual fee used will be the
     * prespecified value.
     *
     * @param  version the orderbook version
     * @return fee     the fee
     */
    function fee(uint32 version) external view returns (uint256 fee);
}
