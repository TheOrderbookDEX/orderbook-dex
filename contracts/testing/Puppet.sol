// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.15;

import { Address } from "@openzeppelin/contracts/utils/Address.sol";

contract Puppet {
    using Address for address;

    function call(address callee, bytes calldata data) external returns (bytes memory) {
        return callee.functionCall(data);
    }
}
