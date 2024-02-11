// File: ../sc_datasets/DAppSCAN/BlockSec-blocksec_stnd_v1.7_signed/standard-evm-d7c016ca098a4e5a554583c499fc0cead4db7088/contracts/tokens/multichain/interfaces/IERC20Internal.sol

// SPDX-License-Identifier: Apache-2.0

// File: contracts/lib/IERC20Internal.sol

pragma solidity 0.6.12;

abstract contract IERC20Internal {
    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual;

    function _transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual;

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual;

    function _increaseAllowance(
        address owner,
        address spender,
        uint256 increment
    ) internal virtual;

    function _decreaseAllowance(
        address owner,
        address spender,
        uint256 decrement
    ) internal virtual;

    function _mint(address account, uint256 amount) internal virtual;

    function _burn(address account, uint256 amount) internal virtual;
}
