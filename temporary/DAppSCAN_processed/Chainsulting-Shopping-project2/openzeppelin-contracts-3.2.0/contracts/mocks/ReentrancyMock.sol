// File: ../sc_datasets/DAppSCAN/Chainsulting-Shopping-project2/openzeppelin-contracts-3.2.0/contracts/utils/ReentrancyGuard.sol

// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    constructor () internal {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and make it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        // On the first call to nonReentrant, _notEntered will be true
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }
}

// File: ../sc_datasets/DAppSCAN/Chainsulting-Shopping-project2/openzeppelin-contracts-3.2.0/contracts/GSN/Context.sol

// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: ../sc_datasets/DAppSCAN/Chainsulting-Shopping-project2/openzeppelin-contracts-3.2.0/contracts/mocks/ReentrancyAttack.sol

// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract ReentrancyAttack is Context {
    function callSender(bytes4 data) public {
        // solhint-disable-next-line avoid-low-level-calls
        (bool success,) = _msgSender().call(abi.encodeWithSelector(data));
        require(success, "ReentrancyAttack: failed call");
    }
}

// File: ../sc_datasets/DAppSCAN/Chainsulting-Shopping-project2/openzeppelin-contracts-3.2.0/contracts/mocks/ReentrancyMock.sol

// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;


contract ReentrancyMock is ReentrancyGuard {
    uint256 public counter;

    constructor () public {
        counter = 0;
    }

    function callback() external nonReentrant {
        _count();
    }

    function countLocalRecursive(uint256 n) public nonReentrant {
        if (n > 0) {
            _count();
            countLocalRecursive(n - 1);
        }
    }

    function countThisRecursive(uint256 n) public nonReentrant {
        if (n > 0) {
            _count();
            // solhint-disable-next-line avoid-low-level-calls
            (bool success,) = address(this).call(abi.encodeWithSignature("countThisRecursive(uint256)", n - 1));
            require(success, "ReentrancyMock: failed call");
        }
    }

    function countAndCall(ReentrancyAttack attacker) public nonReentrant {
        _count();
        bytes4 func = bytes4(keccak256("callback()"));
        attacker.callSender(func);
    }

    function _count() private {
        counter += 1;
    }
}
