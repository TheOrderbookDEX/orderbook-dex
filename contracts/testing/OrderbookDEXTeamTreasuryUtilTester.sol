// SPDX-License-Identifier: BUSL-1.1

pragma solidity 0.8.20;

import { IOrderbookDEXTeamTreasury } from "../interfaces/IOrderbookDEXTeamTreasury.sol";
import { OrderbookDEXTeamTreasuryUtil } from "../utils/OrderbookDEXTeamTreasuryUtil.sol";

contract OrderbookDEXTeamTreasuryUtilTester {
    using OrderbookDEXTeamTreasuryUtil for IOrderbookDEXTeamTreasury;

    function safeFee(IOrderbookDEXTeamTreasury treasury, uint32 version) external view returns (uint256) {
        return treasury.safeFee(version);
    }
}
