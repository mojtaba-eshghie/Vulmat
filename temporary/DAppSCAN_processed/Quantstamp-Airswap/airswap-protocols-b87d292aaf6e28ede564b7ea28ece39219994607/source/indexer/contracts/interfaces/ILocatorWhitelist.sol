// File: ../sc_datasets/DAppSCAN/Quantstamp-Airswap/airswap-protocols-b87d292aaf6e28ede564b7ea28ece39219994607/source/indexer/contracts/interfaces/ILocatorWhitelist.sol

/*
  Copyright 2019 Swap Holdings Ltd.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*/

pragma solidity 0.5.12;

interface ILocatorWhitelist {

  function has(
    bytes32 locator
  ) external view returns (bool);

}