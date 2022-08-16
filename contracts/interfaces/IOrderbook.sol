// SPDX-License-Identifier: BUSL-1.1

pragma solidity ^0.8.0;

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

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
     * @return the orderbook version
     */
    function version() external view returns (uint32);

    /**
     * The token being traded.
     *
     * @return  the token being traded
     */
    function tradedToken() external view returns (IERC20);

    /**
     * The token given in exchange and used for pricing.
     *
     * @return  the token given in exchange and used for pricing
     */
    function baseToken() external view returns (IERC20);

    /**
     * The size of a contract in tradedToken.
     *
     * @return  the size of a contract in tradedToken
     */
    function contractSize() external view returns (uint256);

    /**
     * The price tick in baseToken.
     *
     * All prices are multiples of this value.
     *
     * @return  the price tick in baseToken
     */
    function priceTick() external view returns (uint256);
}
