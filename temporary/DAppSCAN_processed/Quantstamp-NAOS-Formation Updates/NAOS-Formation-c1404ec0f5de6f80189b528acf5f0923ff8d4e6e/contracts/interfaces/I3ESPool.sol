// File: ../sc_datasets/DAppSCAN/Quantstamp-NAOS-Formation Updates/NAOS-Formation-c1404ec0f5de6f80189b528acf5f0923ff8d4e6e/contracts/interfaces/I3ESPool.sol

// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;

interface I3ESPool {
  function add_liquidity(uint256[3] calldata, uint256) external;

  function remove_liquidity_one_coin(uint256, int128, uint256) external;

  function calc_token_amount(uint256[3] calldata, bool) external view returns (uint256);

  function calc_withdraw_one_coin(uint256, int128) external view returns (uint256);

  function coins(uint256) external view returns (address);
}
