// File: ../sc_datasets/DAppSCAN/New_Alchemy_Security_Audit-Right Mesh Smart Contract Audit/0x-monorepo-abd479dc68fa75719647db261130418725fd40d5/contracts/erc721/contracts/src/interfaces/IERC721Receiver.sol

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


contract IERC721Receiver {

    /// @notice Handle the receipt of an NFT
    /// @dev The ERC721 smart contract calls this function on the recipient
    ///  after a `transfer`. This function MAY throw to revert and reject the
    ///  transfer. Return of other than the magic value MUST result in the
    ///  transaction being reverted.
    ///  Note: the contract address is always the message sender.
    /// @param _operator The address which called `safeTransferFrom` function
    /// @param _from The address which previously owned the token
    /// @param _tokenId The NFT identifier which is being transferred
    /// @param _data Additional data with no specified format
    /// @return `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`
    ///  unless throwing
    function onERC721Received(
        address _operator,
        address _from,
        uint256 _tokenId,
        bytes calldata _data
    )
        external
        returns (bytes4);
}

// File: ../sc_datasets/DAppSCAN/New_Alchemy_Security_Audit-Right Mesh Smart Contract Audit/0x-monorepo-abd479dc68fa75719647db261130418725fd40d5/contracts/erc721/contracts/test/DummyERC721Receiver.sol

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

pragma solidity ^0.5.5;

contract DummyERC721Receiver is
    IERC721Receiver
{
    // Function selector for ERC721Receiver.onERC721Received
    // 0x150b7a02
    bytes4 constant internal ERC721_RECEIVED = bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"));

    event TokenReceived(
        address operator,
        address from,
        uint256 tokenId,
        bytes data
    );

    /// @notice Handle the receipt of an NFT
    /// @dev The ERC721 smart contract calls this function on the recipient
    ///      after a `transfer`. This function MAY throw to revert and reject the
    ///      transfer. Return of other than the magic value MUST result in the
    ///      transaction being reverted.
    ///      Note: the contract address is always the message sender.
    /// @param _operator The address which called `safeTransferFrom` function
    /// @param _from The address which previously owned the token
    /// @param _tokenId The NFT identifier which is being transferred
    /// @param _data Additional data with no specified format
    /// @return `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`
    ///         unless throwing
    function onERC721Received(
        address _operator,
        address _from,
        uint256 _tokenId,
        bytes calldata _data
    )
        external
        returns (bytes4)
    {
        emit TokenReceived(
            _operator,
            _from,
            _tokenId,
            _data
        );
        return ERC721_RECEIVED;
    }
}
