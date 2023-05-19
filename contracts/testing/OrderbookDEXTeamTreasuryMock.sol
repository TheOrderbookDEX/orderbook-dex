// SPDX-License-Identifier: BUSL-1.1

pragma solidity 0.8.20;

import { IOrderbookDEXTeamTreasury } from "../interfaces/IOrderbookDEXTeamTreasury.sol";
import { IOrderbook } from "../interfaces/IOrderbook.sol";

contract OrderbookDEXTeamTreasuryMock is IOrderbookDEXTeamTreasury {
    uint256 immutable _fee;

    constructor(uint256 fee_) {
        _fee = fee_;
    }

    function fee(uint32) external view returns (uint256) {
        return _fee;
    }

    function claimFees(IOrderbook orderbook) external {
        orderbook.claimFees();
    }
}
