// SPDX-License-Identifier: BUSL-1.1

pragma solidity 0.8.20;

import { Address } from "@openzeppelin/contracts/utils/Address.sol";

contract Puppet {
    using Address for address;

    function call(address callee, bytes calldata data) external returns (bytes memory) {
        return callee.functionCall(data);
    }
}
