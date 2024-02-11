// File: ../sc_datasets/DAppSCAN/SlowMist-DODO-NFTPool Smart Contract Security Audit Report/contractV2-e16ceb038ed6bf070ea75d9359c7ad54e6f3e226/contracts/lib/ConstFeeRateModel.sol

/*

    Copyright 2020 DODO ZOO.
    SPDX-License-Identifier: Apache-2.0

*/

pragma solidity 0.6.9;

interface IConstFeeRateModel {
    function init(uint256 feeRate) external;

    function getFeeRate(address) external view returns (uint256);
}

contract ConstFeeRateModel {
    uint256 public _FEE_RATE_;

    function init(uint256 feeRate) external {
        _FEE_RATE_ = feeRate;
    }

    function getFeeRate(address) external view returns (uint256) {
        return _FEE_RATE_;
    }
}
