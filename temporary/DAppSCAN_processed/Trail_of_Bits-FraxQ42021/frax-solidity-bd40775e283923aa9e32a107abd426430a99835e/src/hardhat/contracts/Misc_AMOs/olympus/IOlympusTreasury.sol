// File: ../sc_datasets/DAppSCAN/Trail_of_Bits-FraxQ42021/frax-solidity-bd40775e283923aa9e32a107abd426430a99835e/src/hardhat/contracts/Misc_AMOs/olympus/IOlympusTreasury.sol

// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.6.11;

interface IOlympusTreasury {
  function LiquidityDepositorQueue(address) external view returns(uint256);
  function LiquidityManagerQueue(address) external view returns(uint256);
  function LiquidityTokenQueue(address) external view returns(uint256);
  function OHM() external view returns(address);
  function ReserveManagerQueue(address) external view returns(uint256);
  function auditReserves() external;
  function blocksNeededForQueue() external view returns(uint256);
  function bondCalculator(address) external view returns(address);
  function debtorBalance(address) external view returns(uint256);
  function debtorQueue(address) external view returns(uint256);
  function debtors(uint256) external view returns(address);
  function deposit(uint256 _amount, address _token, uint256 _profit) external returns(uint256 send_);
  function excessReserves() external view returns(uint256);
  function incurDebt(uint256 _amount, address _token) external;
  function isDebtor(address) external view returns(bool);
  function isLiquidityDepositor(address) external view returns(bool);
  function isLiquidityManager(address) external view returns(bool);
  function isLiquidityToken(address) external view returns(bool);
  function isReserveDepositor(address) external view returns(bool);
  function isReserveManager(address) external view returns(bool);
  function isReserveSpender(address) external view returns(bool);
  function isReserveToken(address) external view returns(bool);
  function isRewardManager(address) external view returns(bool);
  function liquidityDepositors(uint256) external view returns(address);
  function liquidityManagers(uint256) external view returns(address);
  function liquidityTokens(uint256) external view returns(address);
  function manage(address _token, uint256 _amount) external;
  function manager() external view returns(address);
  function mintRewards(address _recipient, uint256 _amount) external;
  function pullManagement() external;
  function pushManagement(address newOwner_) external;
  function queue(uint8 _managing, address _address) external returns(bool);
  function renounceManagement() external;
  function repayDebtWithOHM(uint256 _amount) external;
  function repayDebtWithReserve(uint256 _amount, address _token) external;
  function reserveDepositorQueue(address) external view returns(uint256);
  function reserveDepositors(uint256) external view returns(address);
  function reserveManagers(uint256) external view returns(address);
  function reserveSpenderQueue(address) external view returns(uint256);
  function reserveSpenders(uint256) external view returns(address);
  function reserveTokenQueue(address) external view returns(uint256);
  function reserveTokens(uint256) external view returns(address);
  function rewardManagerQueue(address) external view returns(uint256);
  function rewardManagers(uint256) external view returns(address);
  function sOHM() external view returns(address);
  function sOHMQueue() external view returns(uint256);
  function toggle(uint8 _managing, address _address, address _calculator) external returns(bool);
  function totalDebt() external view returns(uint256);
  function totalReserves() external view returns(uint256);
  function valueOf(address _token, uint256 _amount) external view returns(uint256 value_);
  function withdraw(uint256 _amount, address _token) external;
}
