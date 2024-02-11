// File: ../sc_datasets/DAppSCAN/consensys-Zer0_zBanc/zBanc-48da0ac1eebbe31a74742f1ae4281b156f03a4bc/solidity/contracts/utility/interfaces/IOwned.sol

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

/*
    Owned contract interface
*/
interface IOwned {
    // this function isn't since the compiler emits automatically generated getter functions as external
    function owner() external view returns (address);

    function transferOwnership(address _newOwner) external;
    function acceptOwnership() external;
}

// File: ../sc_datasets/DAppSCAN/consensys-Zer0_zBanc/zBanc-48da0ac1eebbe31a74742f1ae4281b156f03a4bc/solidity/contracts/utility/Owned.sol

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

/**
  * @dev Provides support and utilities for contract ownership
*/
contract Owned is IOwned {
    address public override owner;
    address public newOwner;

    /**
      * @dev triggered when the owner is updated
      *
      * @param _prevOwner previous owner
      * @param _newOwner  new owner
    */
    event OwnerUpdate(address indexed _prevOwner, address indexed _newOwner);

    /**
      * @dev initializes a new Owned instance
    */
    constructor() public {
        owner = msg.sender;
    }

    // allows execution by the owner only
    modifier ownerOnly {
        _ownerOnly();
        _;
    }

    // error message binary size optimization
    function _ownerOnly() internal view {
        require(msg.sender == owner, "ERR_ACCESS_DENIED");
    }

    /**
      * @dev allows transferring the contract ownership
      * the new owner still needs to accept the transfer
      * can only be called by the contract owner
      *
      * @param _newOwner    new contract owner
    */
    function transferOwnership(address _newOwner) public override ownerOnly {
        require(_newOwner != owner, "ERR_SAME_OWNER");
        newOwner = _newOwner;
    }

    /**
      * @dev used by a new owner to accept an ownership transfer
    */
    function acceptOwnership() override public {
        require(msg.sender == newOwner, "ERR_ACCESS_DENIED");
        emit OwnerUpdate(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}

// File: ../sc_datasets/DAppSCAN/consensys-Zer0_zBanc/zBanc-48da0ac1eebbe31a74742f1ae4281b156f03a4bc/solidity/contracts/bancorx/XTransferRerouter.sol

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

contract XTransferRerouter is Owned {
    bool public reroutingEnabled;

    // triggered when a rerouteTx is called
    event TxReroute(
        uint256 indexed _txId,
        bytes32 _toBlockchain,
        bytes32 _to
    );

    /**
      * @dev initializes a new XTransferRerouter instance
      *
      * @param _reroutingEnabled    intializes transactions routing to enabled/disabled
     */
    constructor(bool _reroutingEnabled) public {
        reroutingEnabled = _reroutingEnabled;
    }
    /**
      * @dev allows the owner to disable/enable rerouting
      *
      * @param _enable     true to enable, false to disable
     */
    function enableRerouting(bool _enable) public ownerOnly {
        reroutingEnabled = _enable;
    }

    // allows execution only when rerouting enabled
    modifier reroutingAllowed {
        _reroutingAllowed();
        _;
    }

    // error message binary size optimization
    function _reroutingAllowed() internal view {
        require(reroutingEnabled, "ERR_DISABLED");
    }

    /**
      * @dev    allows a user to reroute a transaction to a new blockchain/target address
      *
      * @param _txId        the original transaction id
      * @param _blockchain  the new blockchain name
      * @param _to          the new target address/account
     */
    function rerouteTx(uint256 _txId, bytes32 _blockchain, bytes32 _to) public reroutingAllowed {
        emit TxReroute(_txId, _blockchain, _to);
    }
}
