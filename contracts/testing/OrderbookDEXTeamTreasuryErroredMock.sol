// SPDX-License-Identifier: BUSL-1.1

pragma solidity 0.8.17;

contract OrderbookDEXTeamTreasuryErroredMock {
    error Fail();

    function fee(uint32) external pure returns (uint256) {
        revert Fail();
    }
}
