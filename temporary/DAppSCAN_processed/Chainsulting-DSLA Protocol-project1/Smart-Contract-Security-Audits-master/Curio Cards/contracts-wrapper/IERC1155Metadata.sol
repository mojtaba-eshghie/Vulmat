// File: ../sc_datasets/DAppSCAN/Chainsulting-DSLA Protocol-project1/Smart-Contract-Security-Audits-master/Curio Cards/contracts-wrapper/IERC1155Metadata.sol

pragma solidity ^0.5.0;

/**
    Note: The ERC-165 identifier for this interface is 0x0e89341c.
*/
interface ERC1155Metadata_URI {
    /**
        @notice A distinct Uniform Resource Identifier (URI) for a given token.
        @dev URIs are defined in RFC 3986.
        The URI may point to a JSON file that conforms to the "ERC-1155 Metadata URI JSON Schema".
        @return URI string
    */
    function uri(uint256 _id) external view returns (string memory);
}
