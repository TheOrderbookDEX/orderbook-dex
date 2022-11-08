// SPDX-License-Identifier: BUSL-1.1

pragma solidity 0.8.17;

import { ERC20Mock } from "./ERC20Mock.sol";
import { Address } from "@openzeppelin/contracts/utils/Address.sol";

struct Callable {
    address callee;
    bytes data;
}

contract ERC20ForReentrancyTesting is ERC20Mock {
    using Address for address;

    event BeforeTokenTransferSet(address callee, bytes data);

    event AfterTokenTransferSet(address callee, bytes data);

    event BeforeTokenTransferCalled(address callee, bytes data, bytes result);

    event AfterTokenTransferCalled(address callee, bytes data, bytes result);

    Callable internal _callBeforeTransfer;

    Callable internal _callAfterTransfer;

    constructor(string memory name, string memory symbol, uint8 decimals)
        ERC20Mock(name, symbol, decimals)
    {}

    function callBeforeTransfer(Callable calldata callBeforeTransfer_) external {
        _callBeforeTransfer = callBeforeTransfer_;
        emit BeforeTokenTransferSet(callBeforeTransfer_.callee, callBeforeTransfer_.data);
    }

    function callAfterTransfer(Callable calldata callAfterTransfer_) external {
        _callAfterTransfer = callAfterTransfer_;
        emit AfterTokenTransferSet(callAfterTransfer_.callee, callAfterTransfer_.data);
    }

    function _beforeTokenTransfer(address /* from */, address /* to */, uint256 /* amount */) internal override {
        Callable memory callable = _callBeforeTransfer;
        if (callable.callee != address(0)) {
            delete _callBeforeTransfer;
            bytes memory result = callable.callee.functionCall(callable.data);
            emit BeforeTokenTransferCalled(callable.callee, callable.data, result);
        }
    }

    function _afterTokenTransfer(address /* from */, address /* to */, uint256 /* amount */) internal override {
        Callable memory callable = _callAfterTransfer;
        if (callable.callee != address(0)) {
            delete _callAfterTransfer;
            bytes memory result = callable.callee.functionCall(callable.data);
            emit AfterTokenTransferCalled(callable.callee, callable.data, result);
        }
    }
}
