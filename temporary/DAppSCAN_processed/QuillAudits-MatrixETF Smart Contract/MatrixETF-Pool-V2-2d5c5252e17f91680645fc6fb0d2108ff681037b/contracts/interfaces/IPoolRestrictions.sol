// File: ../sc_datasets/DAppSCAN/QuillAudits-MatrixETF Smart Contract/MatrixETF-Pool-V2-2d5c5252e17f91680645fc6fb0d2108ff681037b/contracts/interfaces/IPoolRestrictions.sol

// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

interface IPoolRestrictions {
  function getMaxTotalSupply(address _pool) external view returns (uint256);

  function isVotingSignatureAllowed(address _votingAddress, bytes4 _signature) external view returns (bool);

  function isVotingSenderAllowed(address _votingAddress, address _sender) external view returns (bool);

  function isWithoutFee(address _addr) external view returns (bool);
}
