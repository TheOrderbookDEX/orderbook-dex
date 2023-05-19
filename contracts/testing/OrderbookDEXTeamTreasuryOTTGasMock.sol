// SPDX-License-Identifier: BUSL-1.1

pragma solidity 0.8.20;

contract OrderbookDEXTeamTreasuryOTTGasMock {
    uint256 dummy;

    function fee(uint32) external returns (uint256) {
        dummy++;
        return 0.001 ether;
    }
}
