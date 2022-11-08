// SPDX-License-Identifier: BUSL-1.1

pragma solidity ^0.8.0;

/**
 * Orderbook exchange for a token pair.
 */
interface IOrderbook {
    /**
     * The orderbook version.
     *
     * From right to left, the first two digits is the patch version, the second two digits the minor version,
     * and the rest is the major version, for example the value 10203 corresponds to version 1.2.3.
     *
     * @return version the orderbook version
     */
    function version() external view returns (uint32 version);

    /**
     * The token being traded.
     *
     * @return tradedToken the token being traded
     */
    function tradedToken() external view returns (address tradedToken);

    /**
     * The token given in exchange and used for pricing.
     *
     * @return baseToken the token given in exchange and used for pricing
     */
    function baseToken() external view returns (address baseToken);

    /**
     * The size of a contract in tradedToken.
     *
     * @return contractSize the size of a contract in tradedToken
     */
    function contractSize() external view returns (uint256 contractSize);

    /**
     * The price tick in baseToken.
     *
     * All prices are multiples of this value.
     *
     * @return priceTick the price tick in baseToken
     */
    function priceTick() external view returns (uint256 priceTick);

    /**
     * The ask price in baseToken.
     *
     * @return askPrice the ask price in baseToken
     */
    function askPrice() external view returns (uint256 askPrice);

    /**
     * The bid price in baseToken.
     *
     * @return bidPrice the bid price in baseToken
     */
    function bidPrice() external view returns (uint256 bidPrice);

    /**
     * The next available sell price point.
     *
     * @param  price         an available sell price point
     * @return nextSellPrice the next available sell price point
     */
    function nextSellPrice(uint256 price) external view returns (uint256 nextSellPrice);

    /**
     * The next available buy price point.
     *
     * @param  price        an available buy price point
     * @return nextBuyPrice the next available buy price point
     */
    function nextBuyPrice(uint256 price) external view returns (uint256 nextBuyPrice);
}
