// SPDX-License-Identifier: BUSL-1.1

pragma solidity ^0.8.0;

import { IOrderbookDEXTeamTreasury } from "../interfaces/IOrderbookDEXTeamTreasury.sol";

library OrderbookDEXTeamTreasuryUtil {
    /**
     * Max fee.
     */
    uint256 constant MAX_FEE = 0.005 ether;

    /**
     * The current fee applied to orderbooks of a specific version.
     *
     * @param  treasury the Orderbook DEX Team Treasury
     * @param  version  the orderbook version
     * @return fee      the fee
     */
    function safeFee(IOrderbookDEXTeamTreasury treasury, uint32 version) internal view returns (uint256 fee) {
        try treasury.fee{ gas: 10000 }(version) returns (uint256 fee_) {
            if (fee_ > MAX_FEE) {
                fee = MAX_FEE;
            } else {
                fee = fee_;
            }
        } catch {
            fee = 0;
        }
    }
}
