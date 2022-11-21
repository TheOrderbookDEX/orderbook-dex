// SPDX-License-Identifier: BUSL-1.1

pragma solidity ^0.8.0;

/**
 * Orderbook factory.
 */
interface IOrderbookFactory {
    /**
     * Event emitted when an orderbook is created.
     *
     * @param orderbook    the orderbook created
     * @param tradedToken  the token being traded
     * @param baseToken    the token given in exchange and used for pricing
     * @param contractSize the size of a contract in tradedToken
     * @param priceTick    the price tick in baseToken
     */
    event OrderbookCreated(
        uint32          version,
        address indexed orderbook,
        address indexed tradedToken,
        address indexed baseToken,
        uint256         contractSize,
        uint256         priceTick
    );
}
