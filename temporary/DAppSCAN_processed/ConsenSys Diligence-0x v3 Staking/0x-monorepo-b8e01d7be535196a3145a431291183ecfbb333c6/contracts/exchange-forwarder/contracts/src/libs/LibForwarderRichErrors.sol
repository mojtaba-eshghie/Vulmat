// File: @0x/contracts-utils/contracts/src/LibRichErrors.sol

/*

  Copyright 2019 ZeroEx Intl.

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

pragma solidity ^0.5.9;

library LibRichErrors {
    // bytes4(keccak256("Error(string)"))
    bytes4 internal constant STANDARD_ERROR_SELECTOR = 0x08c379a0;

    /// @dev ABI encode a standard, string revert error payload.
    ///      This is the same payload that would be included by a `revert(string)`
    ///      solidity statement. It has the function signature `Error(string)`.
    /// @param message The error string.
    /// @return The ABI encoded error.
    function StandardError(string memory message) internal pure returns (bytes memory) {
        return abi.encodeWithSelector(STANDARD_ERROR_SELECTOR, bytes(message));
    }

    /// @dev Reverts an encoded rich revert reason `errorData`.
    /// @param errorData ABI encoded error data.
    function rrevert(bytes memory errorData) internal pure {
        assembly {
            revert(add(errorData, 0x20), mload(errorData))
        }
    }
}

// File: ../sc_datasets/DAppSCAN/ConsenSys Diligence-0x v3 Staking/0x-monorepo-b8e01d7be535196a3145a431291183ecfbb333c6/contracts/exchange-forwarder/contracts/src/libs/LibForwarderRichErrors.sol

/*

  Copyright 2019 ZeroEx Intl.

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

pragma solidity ^0.5.9;

library LibForwarderRichErrors {

    // bytes4(keccak256("UnregisteredAssetProxyError()"))
    bytes4 internal constant UNREGISTERED_ASSET_PROXY_ERROR_SELECTOR =
        0xf3b96b8d;

    // bytes4(keccak256("UnsupportedAssetProxyError(bytes4)"))
    bytes4 internal constant UNSUPPORTED_ASSET_PROXY_ERROR_SELECTOR =
        0x7996a271;

    // bytes4(keccak256("CompleteBuyFailedError(uint256,uint256)"))
    bytes4 internal constant COMPLETE_BUY_FAILED_ERROR_SELECTOR =
        0x91353a0c;

    // bytes4(keccak256("UnsupportedFeeError(bytes)"))
    bytes4 internal constant UNSUPPORTED_FEE_ERROR_SELECTOR =
        0x31360af1;

    // bytes4(keccak256("FeePercentageTooLargeError(uint256)"))
    bytes4 internal constant FEE_PERCENTAGE_TOO_LARGE_ERROR_SELECTOR =
        0x1174fb80;

    // bytes4(keccak256("InsufficientEthForFeeError(uint256,uint256)"))
    bytes4 internal constant INSUFFICIENT_ETH_FOR_FEE_ERROR_SELECTOR =
        0xecf40fd9;

    // bytes4(keccak256("OverspentWethError(uint256,uint256)"))
    bytes4 internal constant OVERSPENT_WETH_ERROR_SELECTOR =
        0xcdcbed5d;

    // bytes4(keccak256("TransferFailedError(bytes)"))
    bytes4 internal constant TRANSFER_FAILED_ERROR_SELECTOR =
        0x5e7eb60f;

    // bytes4(keccak256("DefaultFunctionWethContractOnlyError(address)"))
    bytes4 internal constant DEFAULT_FUNCTION_WETH_CONTRACT_ONLY_ERROR_SELECTOR =
        0x08b18698;

    // bytes4(keccak256("MsgValueCannotEqualZeroError()"))
    bytes4 internal constant MSG_VALUE_CANNOT_EQUAL_ZERO_ERROR_SELECTOR =
        0x8c0e562b;

    // bytes4(keccak256("Erc721AmountMustEqualOneError(uint256)"))
    bytes4 internal constant ERC721_AMOUNT_MUST_EQUAL_ONE_ERROR_SELECTOR =
        0xbaffa474;

    // solhint-disable func-name-mixedcase
    function UnregisteredAssetProxyError()
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(UNREGISTERED_ASSET_PROXY_ERROR_SELECTOR);
    }

    function UnsupportedAssetProxyError(
        bytes4 proxyId
    )
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(
            UNSUPPORTED_ASSET_PROXY_ERROR_SELECTOR,
            proxyId
        );
    }

    function CompleteBuyFailedError(
        uint256 expectedAssetBuyAmount,
        uint256 actualAssetBuyAmount
    )
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(
            COMPLETE_BUY_FAILED_ERROR_SELECTOR,
            expectedAssetBuyAmount,
            actualAssetBuyAmount
        );
    }

    function UnsupportedFeeError(
        bytes memory takerFeeAssetData
    )
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(
            UNSUPPORTED_FEE_ERROR_SELECTOR,
            takerFeeAssetData
        );
    }

    function FeePercentageTooLargeError(
        uint256 feePercentage
    )
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(
            FEE_PERCENTAGE_TOO_LARGE_ERROR_SELECTOR,
            feePercentage
        );
    }

    function InsufficientEthForFeeError(
        uint256 ethFeeRequired,
        uint256 ethAvailable
    )
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(
            INSUFFICIENT_ETH_FOR_FEE_ERROR_SELECTOR,
            ethFeeRequired,
            ethAvailable
        );
    }

    function OverspentWethError(
        uint256 wethSpent,
        uint256 msgValue
    )
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(
            OVERSPENT_WETH_ERROR_SELECTOR,
            wethSpent,
            msgValue
        );
    }

    function TransferFailedError(
        bytes memory errorData
    )
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(
            TRANSFER_FAILED_ERROR_SELECTOR,
            errorData
        );
    }

    function DefaultFunctionWethContractOnlyError(
        address senderAddress
    )
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(
            DEFAULT_FUNCTION_WETH_CONTRACT_ONLY_ERROR_SELECTOR,
            senderAddress
        );
    }

    function MsgValueCannotEqualZeroError()
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(MSG_VALUE_CANNOT_EQUAL_ZERO_ERROR_SELECTOR);
    }

    function Erc721AmountMustEqualOneError(
        uint256 amount
    )
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(
            ERC721_AMOUNT_MUST_EQUAL_ONE_ERROR_SELECTOR,
            amount
        );
    }

}