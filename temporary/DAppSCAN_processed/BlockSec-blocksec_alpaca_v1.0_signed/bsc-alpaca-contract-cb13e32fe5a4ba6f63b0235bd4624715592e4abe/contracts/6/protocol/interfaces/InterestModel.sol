// File: ../sc_datasets/DAppSCAN/BlockSec-blocksec_alpaca_v1.0_signed/bsc-alpaca-contract-cb13e32fe5a4ba6f63b0235bd4624715592e4abe/contracts/6/protocol/interfaces/InterestModel.sol

// SPDX-License-Identifier: MIT
/**
  ∩~~~~∩ 
  ξ ･×･ ξ 
  ξ　~　ξ 
  ξ　　 ξ 
  ξ　　 “~～~～〇 
  ξ　　　　　　 ξ 
  ξ ξ ξ~～~ξ ξ ξ 
　 ξ_ξξ_ξ　ξ_ξξ_ξ
Alpaca Fin Corporation
*/

pragma solidity 0.6.6;

interface InterestModel {
  /// @dev Return the interest rate per second, using 1e18 as denom.
  function getInterestRate(uint256 debt, uint256 floating) external view returns (uint256);
}