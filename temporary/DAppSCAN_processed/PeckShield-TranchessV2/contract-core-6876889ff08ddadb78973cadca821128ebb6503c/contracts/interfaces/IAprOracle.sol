// File: ../sc_datasets/DAppSCAN/PeckShield-TranchessV2/contract-core-6876889ff08ddadb78973cadca821128ebb6503c/contracts/interfaces/IAprOracle.sol

// SPDX-License-Identifier: MIT
pragma solidity >=0.6.10 <0.8.0;

interface IAprOracle {
    function capture() external returns (uint256 dailyRate);
}
