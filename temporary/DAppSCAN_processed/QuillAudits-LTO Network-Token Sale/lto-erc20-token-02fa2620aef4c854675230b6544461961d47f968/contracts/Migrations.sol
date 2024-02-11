// File: ../sc_datasets/DAppSCAN/QuillAudits-LTO Network-Token Sale/lto-erc20-token-02fa2620aef4c854675230b6544461961d47f968/contracts/Migrations.sol

pragma solidity ^0.4.24;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  constructor() public {
    owner = msg.sender;
  }

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}