// File: ../sc_datasets/DAppSCAN/PeckShield-starkex/starkex-contracts-master/scalable-dex/contracts/src/interfaces/MUsersV2.sol

// SPDX-License-Identifier: Apache-2.0.
pragma solidity ^0.6.12;

abstract contract MUsersV2 {
    function registerUser(
        // NOLINT external-function.
        address ethKey,
        uint256 starkKey,
        bytes calldata signature
    ) public virtual;
}
