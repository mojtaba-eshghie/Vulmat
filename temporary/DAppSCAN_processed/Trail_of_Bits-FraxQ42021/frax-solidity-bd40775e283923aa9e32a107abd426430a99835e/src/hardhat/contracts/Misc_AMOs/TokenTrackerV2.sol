// File: ../sc_datasets/DAppSCAN/Trail_of_Bits-FraxQ42021/frax-solidity-bd40775e283923aa9e32a107abd426430a99835e/src/hardhat/contracts/Math/SafeMath.sol

// SPDX-License-Identifier: MIT
pragma solidity >=0.6.11;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     *
     * _Available since v2.4.0._
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: ../sc_datasets/DAppSCAN/Trail_of_Bits-FraxQ42021/frax-solidity-bd40775e283923aa9e32a107abd426430a99835e/src/hardhat/contracts/Oracle/AggregatorV3Interface.sol

// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

interface AggregatorV3Interface {

  function decimals() external view returns (uint8);
  function description() external view returns (string memory);
  function version() external view returns (uint256);

  // getRoundData and latestRoundData should both raise "No data present"
  // if they do not have data to report, instead of returning unset values
  // which could be misinterpreted as actual reported values.
  function getRoundData(uint80 _roundId)
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );
  function latestRoundData()
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );

}

// File: ../sc_datasets/DAppSCAN/Trail_of_Bits-FraxQ42021/frax-solidity-bd40775e283923aa9e32a107abd426430a99835e/src/hardhat/contracts/Oracle/IPricePerShareOptions.sol

// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.8.0;

interface IPricePerShareOptions {
    // Compound-style [Comp, Cream, Rari, Scream]
    // Multiplied by 1e18
    function exchangeRateStored() external view returns (uint256);

    // Curve-style [Curve, Convex, NOT StakeDAO]
    // In 1e18
    function get_virtual_price() external view returns (uint256);

    // SaddleD4Pool (SwapFlashLoan)
    function getVirtualPrice() external view returns (uint256);

    // StakeDAO
    function getPricePerFullShare() external view returns (uint256);

    // Yearn Vault
    function pricePerShare() external view returns (uint256);
}

// File: ../sc_datasets/DAppSCAN/Trail_of_Bits-FraxQ42021/frax-solidity-bd40775e283923aa9e32a107abd426430a99835e/src/hardhat/contracts/Common/Context.sol

// SPDX-License-Identifier: MIT
pragma solidity >=0.6.11;

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
        return payable(msg.sender);
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: ../sc_datasets/DAppSCAN/Trail_of_Bits-FraxQ42021/frax-solidity-bd40775e283923aa9e32a107abd426430a99835e/src/hardhat/contracts/ERC20/IERC20.sol

// SPDX-License-Identifier: MIT
pragma solidity >=0.6.11;


/**
 * @dev Interface of the ERC20 standard as defined in the EIP. Does not include
 * the optional functions; to access them see {ERC20Detailed}.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: ../sc_datasets/DAppSCAN/Trail_of_Bits-FraxQ42021/frax-solidity-bd40775e283923aa9e32a107abd426430a99835e/src/hardhat/contracts/Utils/Address.sol

// SPDX-License-Identifier: MIT
pragma solidity >=0.6.11 <0.9.0;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: value }(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data, string memory errorMessage) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(bool success, bytes memory returndata, string memory errorMessage) private pure returns(bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

// File: ../sc_datasets/DAppSCAN/Trail_of_Bits-FraxQ42021/frax-solidity-bd40775e283923aa9e32a107abd426430a99835e/src/hardhat/contracts/ERC20/ERC20.sol

// SPDX-License-Identifier: MIT
pragma solidity >=0.6.11;




/**
 * @dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 * For a generic mechanism see {ERC20Mintable}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * We have followed general OpenZeppelin guidelines: functions revert instead
 * of returning `false` on failure. This behavior is nonetheless conventional
 * and does not conflict with the expectations of ERC20 applications.
 *
 * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 *
 * Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
 * functions have been added to mitigate the well-known issues around setting
 * allowances. See {IERC20-approve}.
 */
 
contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;
    uint8 private _decimals;
    
    /**
     * @dev Sets the values for {name} and {symbol}, initializes {decimals} with
     * a default value of 18.
     *
     * To select a different value for {decimals}, use {_setupDecimals}.
     *
     * All three of these values are immutable: they can only be set once during
     * construction.
     */
    constructor (string memory __name, string memory __symbol) public {
        _name = __name;
        _symbol = __symbol;
        _decimals = 18;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless {_setupDecimals} is
     * called.
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view returns (uint8) {
        return _decimals;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.approve(address spender, uint256 amount)
     */
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20};
     *
     * Requirements:
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for `sender`'s tokens of at least
     * `amount`.
     */
    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    /**
     * @dev Moves tokens `amount` from `sender` to `recipient`.
     *
     * This is internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(address sender, address recipient, uint256 amount) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amount);

        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements
     *
     * - `to` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from the caller.
     *
     * See {ERC20-_burn}.
     */
    function burn(uint256 amount) public virtual {
        _burn(_msgSender(), amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, deducting from the caller's
     * allowance.
     *
     * See {ERC20-_burn} and {ERC20-allowance}.
     *
     * Requirements:
     *
     * - the caller must have allowance for `accounts`'s tokens of at least
     * `amount`.
     */
    function burnFrom(address account, uint256 amount) public virtual {
        uint256 decreasedAllowance = allowance(account, _msgSender()).sub(amount, "ERC20: burn amount exceeds allowance");

        _approve(account, _msgSender(), decreasedAllowance);
        _burn(account, amount);
    }


    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner`s tokens.
     *
     * This is internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`.`amount` is then deducted
     * from the caller's allowance.
     *
     * See {_burn} and {_approve}.
     */
    function _burnFrom(address account, uint256 amount) internal virtual {
        _burn(account, amount);
        _approve(account, _msgSender(), _allowances[account][_msgSender()].sub(amount, "ERC20: burn amount exceeds allowance"));
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of `from`'s tokens
     * will be to transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of `from`'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:using-hooks.adoc[Using Hooks].
     */
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual { }
}

// File: ../sc_datasets/DAppSCAN/Trail_of_Bits-FraxQ42021/frax-solidity-bd40775e283923aa9e32a107abd426430a99835e/src/hardhat/contracts/Staking/Owned.sol

// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.6.11;

// https://docs.synthetix.io/contracts/Owned
contract Owned {
    address public owner;
    address public nominatedOwner;

    constructor (address _owner) public {
        require(_owner != address(0), "Owner address cannot be 0");
        owner = _owner;
        emit OwnerChanged(address(0), _owner);
    }

    function nominateNewOwner(address _owner) external onlyOwner {
        nominatedOwner = _owner;
        emit OwnerNominated(_owner);
    }

    function acceptOwnership() external {
        require(msg.sender == nominatedOwner, "You must be nominated before you can accept ownership");
        emit OwnerChanged(owner, nominatedOwner);
        owner = nominatedOwner;
        nominatedOwner = address(0);
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only the contract owner may perform this action");
        _;
    }

    event OwnerNominated(address newOwner);
    event OwnerChanged(address oldOwner, address newOwner);
}

// File: ../sc_datasets/DAppSCAN/Trail_of_Bits-FraxQ42021/frax-solidity-bd40775e283923aa9e32a107abd426430a99835e/src/hardhat/contracts/Oracle/ComboOracle.sol

// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

// ====================================================================
// |     ______                   _______                             |
// |    / _____________ __  __   / ____(_____  ____ _____  ________   |
// |   / /_  / ___/ __ `| |/_/  / /_  / / __ \/ __ `/ __ \/ ___/ _ \  |
// |  / __/ / /  / /_/ _>  <   / __/ / / / / / /_/ / / / / /__/  __/  |
// | /_/   /_/   \__,_/_/|_|  /_/   /_/_/ /_/\__,_/_/ /_/\___/\___/   |
// |                                                                  |
// ====================================================================
// =========================== ComboOracle ============================
// ====================================================================
// Aggregates prices for various tokens

// Frax Finance: https://github.com/FraxFinance

// Primary Author(s)
// Travis Moore: https://github.com/FortisFortuna

// Reviewer(s) / Contributor(s)
// Jason Huan: https://github.com/jasonhuan
// Sam Kazemian: https://github.com/samkazemian




contract ComboOracle is Owned {

    /* ========== STATE VARIABLES ========== */
    
    address timelock_address;
    address address_to_consult;
    AggregatorV3Interface private priceFeedETHUSD;

    uint256 public PRECISE_PRICE_PRECISION = 1e18;
    uint256 public PRICE_PRECISION = 1e6;
    uint256 public PRICE_MISSING_MULTIPLIER = 1e12;

    address[] public all_token_addresses;
    mapping(address => TokenInfo) public token_info; // token address => info

    /* ========== STRUCTS ========== */

    struct TokenInfoConstructorArgs {
        address token_address;
        address agg_addr_for_underlying; 
        uint256 agg_other_side; // 0: USD, 1: ETH
        address underlying_tkn_address; // Will be address(0) for simple tokens. Otherwise, the aUSDC, yvUSDC address, etc
        address pps_override_address;
        bytes4 pps_call_selector; // eg bytes4(keccak256("pricePerShare()"));
        uint256 pps_decimals;
    }

    struct TokenInfo {
        address token_address;
        string symbol;
        address agg_addr_for_underlying; 
        uint256 agg_other_side; // 0: USD, 1: ETH
        uint256 agg_decimals;
        address underlying_tkn_address; // Will be address(0) for simple tokens. Otherwise, the aUSDC, yvUSDC address, etc
        address pps_override_address;
        bytes4 pps_call_selector; // eg bytes4(keccak256("pricePerShare()"));
        uint256 pps_decimals;
        int256 ctkn_undrly_missing_decs;
    }

    /* ========== CONSTRUCTOR ========== */

    constructor (
        address _owner_address,
        address _eth_usd_chainlink_address,
        string memory _native_token_symbol
    ) Owned(_owner_address) {
        priceFeedETHUSD = AggregatorV3Interface(_eth_usd_chainlink_address);

        // Handle native ETH
        all_token_addresses.push(address(0));
        token_info[address(0)] = TokenInfo(
            address(0),
            _native_token_symbol,
            address(_eth_usd_chainlink_address),
            0,
            8,
            address(0),
            address(0),
            bytes4(0),
            0,
            0
        );
    }

    /* ========== MODIFIERS ========== */

    modifier onlyByOwnGov() {
        require(msg.sender == owner || msg.sender == timelock_address, "You are not an owner or the governance timelock");
        _;
    }

    /* ========== VIEWS ========== */

    function allTokenAddresses() public view returns (address[] memory) {
        return all_token_addresses;
    }

    function allTokenInfos() public view returns (TokenInfo[] memory) {
        TokenInfo[] memory return_data = new TokenInfo[](all_token_addresses.length);
        for (uint i = 0; i < all_token_addresses.length; i++){ 
            return_data[i] = token_info[all_token_addresses[i]];
        }
        return return_data;
    }

    // E6
    function getETHPrice() public view returns (uint256) {
        ( , int price, , , ) = priceFeedETHUSD.latestRoundData();
        return (uint256(price) * (PRICE_PRECISION)) / (1e8); // ETH/USD is 8 decimals on Chainlink
    }

    // E18
    function getETHPricePrecise() public view returns (uint256) {
        ( , int price, , , ) = priceFeedETHUSD.latestRoundData();
        return (uint256(price) * (PRECISE_PRICE_PRECISION)) / (1e8); // ETH/USD is 8 decimals on Chainlink
    }

    function getTokenPrice(address token_address) public view returns (uint256 precise_price, uint256 short_price) {
        // Get the token info
        TokenInfo memory thisTokenInfo = token_info[token_address];

        // Get the price for the underlying token
        ( , int price, , , ) = AggregatorV3Interface(thisTokenInfo.agg_addr_for_underlying).latestRoundData();
        uint256 agg_price = uint256(price);

        // Convert to USD, if not already
        if (thisTokenInfo.agg_other_side == 1) agg_price = (agg_price * getETHPricePrecise()) / PRECISE_PRICE_PRECISION;

        // cToken balance * pps = amt of underlying in native decimals
        uint256 price_per_share = 1;
        if (thisTokenInfo.underlying_tkn_address != address(0)){
            address pps_address_to_use = thisTokenInfo.token_address;
            if (thisTokenInfo.pps_override_address != address(0)) pps_address_to_use = thisTokenInfo.pps_override_address;
            (bool success, bytes memory data) = (pps_address_to_use).staticcall(abi.encodeWithSelector(thisTokenInfo.pps_call_selector));
            require(success, 'Oracle Failed');

            price_per_share = abi.decode(data, (uint256));
        }

        // E18
        uint256 pps_multiplier = (uint256(10) ** (thisTokenInfo.pps_decimals));

        // Handle difference in decimals()
        if (thisTokenInfo.ctkn_undrly_missing_decs < 0){
            uint256 ctkn_undr_miss_dec_mult = (10 ** uint256(-1 * thisTokenInfo.ctkn_undrly_missing_decs));
            precise_price = (agg_price * PRECISE_PRICE_PRECISION * price_per_share) / (ctkn_undr_miss_dec_mult * pps_multiplier * (uint256(10) ** (thisTokenInfo.agg_decimals)));
        }
        else {
            uint256 ctkn_undr_miss_dec_mult = (10 ** uint256(thisTokenInfo.ctkn_undrly_missing_decs));
            precise_price = (agg_price * PRECISE_PRICE_PRECISION * price_per_share * ctkn_undr_miss_dec_mult) / (pps_multiplier * (uint256(10) ** (thisTokenInfo.agg_decimals)));
        }
        

        // E6
        short_price = precise_price / PRICE_MISSING_MULTIPLIER;
    }

    /* ========== RESTRICTED GOVERNANCE FUNCTIONS ========== */

    function setTimelock(address _timelock_address) external onlyByOwnGov {
        timelock_address = _timelock_address;
    }

    function batchSetOracleInfoDirect(TokenInfoConstructorArgs[] memory _initial_token_infos) external onlyByOwnGov {
        // Batch set token info
        for (uint256 i = 0; i < _initial_token_infos.length; i++){ 
            TokenInfoConstructorArgs memory this_token_info = _initial_token_infos[i];
            _setTokenInfo(
                this_token_info.token_address, 
                this_token_info.agg_addr_for_underlying, 
                this_token_info.agg_other_side, 
                this_token_info.underlying_tkn_address, 
                this_token_info.pps_override_address,
                this_token_info.pps_call_selector, 
                this_token_info.pps_decimals
            );
        }
    }

    // Sets oracle info for a token 
    // Chainlink Addresses
    // https://docs.chain.link/docs/ethereum-addresses/

    // exchangeRateStored: 0x182df0f5
    // getPricePerFullShare: 0x77c7b8fc
    // get_virtual_price: 0xbb7b8b80
    // getVirtualPrice: 0xe25aa5fa
    // pricePerShare: 0x99530b06

    // Function signature encoder
    //     web3_data.eth.abi.encodeFunctionSignature({
    //     name: 'getVirtualPrice',
    //     type: 'function',
    //     inputs: []
    // })
    //     web3_data.eth.abi.encodeFunctionSignature({
    //     name: 'myMethod',
    //     type: 'function',
    //     inputs: [{
    //         type: 'uint256',
    //         name: 'myNumber'
    //     }]
    // })

    // To burn something, for example, type this on app.frax.finance's JS console
    // https://web3js.readthedocs.io/en/v1.2.11/web3-eth-abi.html#encodefunctioncall
    // web3_data.eth.abi.encodeFunctionCall({
    //     name: 'burn',
    //     type: 'function',
    //     inputs: [{
    //         type: 'uint256',
    //         name: 'myNumber'
    //     }]
    // }, ['100940878321208298244715']);

    function _setTokenInfo(
        address token_address, 
        address agg_addr_for_underlying, 
        uint256 agg_other_side,
        address underlying_tkn_address,
        address pps_override_address,
        bytes4 pps_call_selector,
        uint256 pps_decimals
    ) internal {
        require(token_address != address(0), "Cannot add zero address");

        // See if there are any missing decimals between a cToken and the underlying
        int256 ctkn_undrly_missing_decs = 0;
        if (underlying_tkn_address != address(0)){
            uint256 cToken_decs = ERC20(token_address).decimals();
            uint256 underlying_decs = ERC20(underlying_tkn_address).decimals();

            ctkn_undrly_missing_decs = int256(cToken_decs) - int256(underlying_decs);
        }

        // Add the token address to the array if it doesn't already exist
        bool token_exists = false;
        for (uint i = 0; i < all_token_addresses.length; i++){ 
            if (all_token_addresses[i] == token_address) {
                token_exists = true;
                break;
            }
        }
        if (!token_exists) all_token_addresses.push(token_address);

        // Add the token to the mapping
        token_info[token_address] = TokenInfo(
            token_address,
            ERC20(token_address).name(),
            agg_addr_for_underlying,
            agg_other_side,
            uint256(AggregatorV3Interface(agg_addr_for_underlying).decimals()),
            underlying_tkn_address,
            pps_override_address,
            pps_call_selector,
            pps_decimals,
            ctkn_undrly_missing_decs
        );
    }

    function setTokenInfo(
        address token_address, 
        address agg_addr_for_underlying, 
        uint256 agg_other_side,
        address underlying_tkn_address,
        address pps_override_address,
        bytes4 pps_call_selector,
        uint256 pps_decimals
    ) public onlyByOwnGov {
        _setTokenInfo(token_address, agg_addr_for_underlying, agg_other_side, underlying_tkn_address, pps_override_address, pps_call_selector, pps_decimals);
    }

}

// File: ../sc_datasets/DAppSCAN/Trail_of_Bits-FraxQ42021/frax-solidity-bd40775e283923aa9e32a107abd426430a99835e/src/hardhat/contracts/Frax/IFrax.sol

// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.6.11;

interface IFrax {
  function COLLATERAL_RATIO_PAUSER() external view returns (bytes32);
  function DEFAULT_ADMIN_ADDRESS() external view returns (address);
  function DEFAULT_ADMIN_ROLE() external view returns (bytes32);
  function addPool(address pool_address ) external;
  function allowance(address owner, address spender ) external view returns (uint256);
  function approve(address spender, uint256 amount ) external returns (bool);
  function balanceOf(address account ) external view returns (uint256);
  function burn(uint256 amount ) external;
  function burnFrom(address account, uint256 amount ) external;
  function collateral_ratio_paused() external view returns (bool);
  function controller_address() external view returns (address);
  function creator_address() external view returns (address);
  function decimals() external view returns (uint8);
  function decreaseAllowance(address spender, uint256 subtractedValue ) external returns (bool);
  function eth_usd_consumer_address() external view returns (address);
  function eth_usd_price() external view returns (uint256);
  function frax_eth_oracle_address() external view returns (address);
  function frax_info() external view returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256, uint256);
  function frax_pools(address ) external view returns (bool);
  function frax_pools_array(uint256 ) external view returns (address);
  function frax_price() external view returns (uint256);
  function frax_step() external view returns (uint256);
  function fxs_address() external view returns (address);
  function fxs_eth_oracle_address() external view returns (address);
  function fxs_price() external view returns (uint256);
  function genesis_supply() external view returns (uint256);
  function getRoleAdmin(bytes32 role ) external view returns (bytes32);
  function getRoleMember(bytes32 role, uint256 index ) external view returns (address);
  function getRoleMemberCount(bytes32 role ) external view returns (uint256);
  function globalCollateralValue() external view returns (uint256);
  function global_collateral_ratio() external view returns (uint256);
  function grantRole(bytes32 role, address account ) external;
  function hasRole(bytes32 role, address account ) external view returns (bool);
  function increaseAllowance(address spender, uint256 addedValue ) external returns (bool);
  function last_call_time() external view returns (uint256);
  function minting_fee() external view returns (uint256);
  function name() external view returns (string memory);
  function owner_address() external view returns (address);
  function pool_burn_from(address b_address, uint256 b_amount ) external;
  function pool_mint(address m_address, uint256 m_amount ) external;
  function price_band() external view returns (uint256);
  function price_target() external view returns (uint256);
  function redemption_fee() external view returns (uint256);
  function refreshCollateralRatio() external;
  function refresh_cooldown() external view returns (uint256);
  function removePool(address pool_address ) external;
  function renounceRole(bytes32 role, address account ) external;
  function revokeRole(bytes32 role, address account ) external;
  function setController(address _controller_address ) external;
  function setETHUSDOracle(address _eth_usd_consumer_address ) external;
  function setFRAXEthOracle(address _frax_oracle_addr, address _weth_address ) external;
  function setFXSAddress(address _fxs_address ) external;
  function setFXSEthOracle(address _fxs_oracle_addr, address _weth_address ) external;
  function setFraxStep(uint256 _new_step ) external;
  function setMintingFee(uint256 min_fee ) external;
  function setOwner(address _owner_address ) external;
  function setPriceBand(uint256 _price_band ) external;
  function setPriceTarget(uint256 _new_price_target ) external;
  function setRedemptionFee(uint256 red_fee ) external;
  function setRefreshCooldown(uint256 _new_cooldown ) external;
  function setTimelock(address new_timelock ) external;
  function symbol() external view returns (string memory);
  function timelock_address() external view returns (address);
  function toggleCollateralRatio() external;
  function totalSupply() external view returns (uint256);
  function transfer(address recipient, uint256 amount ) external returns (bool);
  function transferFrom(address sender, address recipient, uint256 amount ) external returns (bool);
  function weth_address() external view returns (address);
}

// File: ../sc_datasets/DAppSCAN/Trail_of_Bits-FraxQ42021/frax-solidity-bd40775e283923aa9e32a107abd426430a99835e/src/hardhat/contracts/Frax/IFraxAMOMinter.sol

// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.6.11;

// MAY need to be updated
interface IFraxAMOMinter {
  function FRAX() external view returns(address);
  function FXS() external view returns(address);
  function acceptOwnership() external;
  function addAMO(address amo_address, bool sync_too) external;
  function allAMOAddresses() external view returns(address[] memory);
  function allAMOsLength() external view returns(uint256);
  function amos(address) external view returns(bool);
  function amos_array(uint256) external view returns(address);
  function burnFraxFromAMO(uint256 frax_amount) external;
  function burnFxsFromAMO(uint256 fxs_amount) external;
  function col_idx() external view returns(uint256);
  function collatDollarBalance() external view returns(uint256);
  function collatDollarBalanceStored() external view returns(uint256);
  function collat_borrow_cap() external view returns(int256);
  function collat_borrowed_balances(address) external view returns(int256);
  function collat_borrowed_sum() external view returns(int256);
  function collateral_address() external view returns(address);
  function collateral_token() external view returns(address);
  function correction_offsets_amos(address, uint256) external view returns(int256);
  function custodian_address() external view returns(address);
  function dollarBalances() external view returns(uint256 frax_val_e18, uint256 collat_val_e18);
  // function execute(address _to, uint256 _value, bytes _data) external returns(bool, bytes);
  function fraxDollarBalanceStored() external view returns(uint256);
  function fraxTrackedAMO(address amo_address) external view returns(int256);
  function fraxTrackedGlobal() external view returns(int256);
  function frax_mint_balances(address) external view returns(int256);
  function frax_mint_cap() external view returns(int256);
  function frax_mint_sum() external view returns(int256);
  function fxs_mint_balances(address) external view returns(int256);
  function fxs_mint_cap() external view returns(int256);
  function fxs_mint_sum() external view returns(int256);
  function giveCollatToAMO(address destination_amo, uint256 collat_amount) external;
  function min_cr() external view returns(uint256);
  function mintFraxForAMO(address destination_amo, uint256 frax_amount) external;
  function mintFxsForAMO(address destination_amo, uint256 fxs_amount) external;
  function missing_decimals() external view returns(uint256);
  function nominateNewOwner(address _owner) external;
  function nominatedOwner() external view returns(address);
  function oldPoolCollectAndGive(address destination_amo) external;
  function oldPoolRedeem(uint256 frax_amount) external;
  function old_pool() external view returns(address);
  function owner() external view returns(address);
  function pool() external view returns(address);
  function receiveCollatFromAMO(uint256 usdc_amount) external;
  function recoverERC20(address tokenAddress, uint256 tokenAmount) external;
  function removeAMO(address amo_address, bool sync_too) external;
  function setAMOCorrectionOffsets(address amo_address, int256 frax_e18_correction, int256 collat_e18_correction) external;
  function setCollatBorrowCap(uint256 _collat_borrow_cap) external;
  function setCustodian(address _custodian_address) external;
  function setFraxMintCap(uint256 _frax_mint_cap) external;
  function setFraxPool(address _pool_address) external;
  function setFxsMintCap(uint256 _fxs_mint_cap) external;
  function setMinimumCollateralRatio(uint256 _min_cr) external;
  function setTimelock(address new_timelock) external;
  function syncDollarBalances() external;
  function timelock_address() external view returns(address);
}

// File: ../sc_datasets/DAppSCAN/Trail_of_Bits-FraxQ42021/frax-solidity-bd40775e283923aa9e32a107abd426430a99835e/src/hardhat/contracts/Uniswap/TransferHelper.sol

// SPDX-License-Identifier: MIT
pragma solidity >=0.6.11;

// helper methods for interacting with ERC20 tokens and sending ETH that do not consistently return true/false
library TransferHelper {
    function safeApprove(address token, address to, uint value) internal {
        // bytes4(keccak256(bytes('approve(address,uint256)')));
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(0x095ea7b3, to, value));
        require(success && (data.length == 0 || abi.decode(data, (bool))), 'TransferHelper: APPROVE_FAILED');
    }

    function safeTransfer(address token, address to, uint value) internal {
        // bytes4(keccak256(bytes('transfer(address,uint256)')));
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(0xa9059cbb, to, value));
        require(success && (data.length == 0 || abi.decode(data, (bool))), 'TransferHelper: TRANSFER_FAILED');
    }

    function safeTransferFrom(address token, address from, address to, uint value) internal {
        // bytes4(keccak256(bytes('transferFrom(address,address,uint256)')));
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(0x23b872dd, from, to, value));
        require(success && (data.length == 0 || abi.decode(data, (bool))), 'TransferHelper: TRANSFER_FROM_FAILED');
    }

    function safeTransferETH(address to, uint value) internal {
        (bool success,) = to.call{value:value}(new bytes(0));
        require(success, 'TransferHelper: ETH_TRANSFER_FAILED');
    }
}

// File: ../sc_datasets/DAppSCAN/Trail_of_Bits-FraxQ42021/frax-solidity-bd40775e283923aa9e32a107abd426430a99835e/src/hardhat/contracts/Misc_AMOs/TokenTrackerV2.sol

// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.8.0;

// ====================================================================
// |     ______                   _______                             |
// |    / _____________ __  __   / ____(_____  ____ _____  ________   |
// |   / /_  / ___/ __ `| |/_/  / /_  / / __ \/ __ `/ __ \/ ___/ _ \  |
// |  / __/ / /  / /_/ _>  <   / __/ / / / / / /_/ / / / / /__/  __/  |
// | /_/   /_/   \__,_/_/|_|  /_/   /_/_/ /_/\__,_/_/ /_/\___/\___/   |
// |                                                                  |
// ====================================================================
// ========================== TokenTrackerV2 ==========================
// ====================================================================
// Tracks the value of protocol-owned ERC tokens (and ETH too) so they 
// can be added to the global collateral value.
// Frax Finance: https://github.com/FraxFinance

// Primary Author(s)
// Travis Moore: https://github.com/FortisFortuna

// Reviewer(s) / Contributor(s)

// Jason Huan: https://github.com/jasonhuan
// Sam Kazemian: https://github.com/samkazemian







contract TokenTrackerV2 is Owned {
    using SafeMath for uint256;
    // SafeMath automatically included in Solidity >= 8.0.0

    /* ========== STATE VARIABLES ========== */

    IFrax public IFRAX = IFrax(0x853d955aCEf822Db058eb8505911ED77F175b99e);
    IFraxAMOMinter public amo_minter;
    ComboOracle public ethUSDOracle;

    // Tracked addresses
    address[] public tracked_addresses;
    mapping(address => bool) public is_address_tracked; // tracked address => is tracked
    mapping(address => address[]) public tokens_for_address; // tracked address => tokens to track

    // Oracle related
    mapping(address => OracleCRInfo) public oracle_cr_infos; // token address => oracle_address
    uint256 public chainlink_eth_usd_decimals;

    address public timelock_address;
    address public custodian_address;

    uint256 public PRICE_PRECISION = 1e6;
    uint256 public PRECISE_PRICE_PRECISION = 1e18;

    bool public use_stored_cr = true;
    uint256 public stored_cr;
    
    /* ========== STRUCTS ========== */

    struct TrackingTokensBatch {
        address tracked_address;
        address[] token_addresses;
    }
    
    struct OracleCRInfo {
        address token_address;
        address oracle_address;
        bool use_cr;
    }

    /* ========== CONSTRUCTOR ========== */
    
    constructor (
        address _owner_address,
        address _amo_minter_address,
        address _eth_oracle_address,
        address[] memory _initial_tracked_addresses
    ) Owned(_owner_address) {
        amo_minter = IFraxAMOMinter(_amo_minter_address);
        ethUSDOracle = ComboOracle(_eth_oracle_address);

        // Get the custodian and timelock addresses from the minter
        custodian_address = amo_minter.custodian_address();
        timelock_address = amo_minter.timelock_address();

        // Refresh the stored CR
        stored_cr = IFRAX.global_collateral_ratio();

        // Set the initial tracked addresses
        for (uint256 i = 0; i < _initial_tracked_addresses.length; i++){ 
            address tracked_addr = _initial_tracked_addresses[i];
            tracked_addresses.push(tracked_addr);
            is_address_tracked[tracked_addr] = true;
        }

        // // Add the oracle information for each token
        // for (uint256 i = 0; i < _initial_token_oracles.length; i++){ 
        //     OracleCRInfo memory thisOracleCRInfo = _initial_token_oracles[i];
        //     oracle_cr_infos[thisOracleCRInfo.token_address] = thisOracleCRInfo;
        // }

        // // Add the tracked tokens for each tracked address
        // for (uint256 i = 0; i < _initial_tracked_tokens.length; i++){ 
        //     TrackingTokensBatch memory thisTrackingConstruct = _initial_tracked_tokens[i];
        //     for (uint256 j = 0; j < thisTrackingConstruct.token_addresses.length; j++){ 
        //         tokens_for_address[thisTrackingConstruct.tracked_address].push(thisTrackingConstruct.token_addresses[j]);
        //     }
        // }
    }

    /* ========== MODIFIERS ========== */

    modifier onlyByOwnGov() {
        require(msg.sender == timelock_address || msg.sender == owner, "Not owner or timelock");
        _;
    }

    modifier onlyByOwnGovCust() {
        require(msg.sender == timelock_address || msg.sender == owner || msg.sender == custodian_address, "Not owner, tlck, or custd");
        _;
    }

    modifier onlyByMinter() {
        require(msg.sender == address(amo_minter), "Not minter");
        _;
    }

    /* ========== VIEWS ========== */

    function showAllocations() public view returns (uint256[1] memory allocations) {
        allocations[0] = getTotalValue(false); // Total Value
    }

    function dollarBalances() public view returns (uint256 frax_val_e18, uint256 collat_val_e18) {
        frax_val_e18 = getTotalValue(false); // Ignores CR logic
        collat_val_e18 = getTotalValue(true); // Uses CR logic
    }

    // Backwards compatibility
    function mintedBalance() public view returns (int256) {
        return amo_minter.frax_mint_balances(address(this));
    }

    function allTrackedAddresses() public view returns (address[] memory) {
        return tracked_addresses;
    }

    function allTokensForAddress(address tracked_address) public view returns (address[] memory) {
        return tokens_for_address[tracked_address];
    }

    function getCR() public view returns (uint256) {
        if (use_stored_cr) return stored_cr;
        else {
            return IFRAX.global_collateral_ratio();
        }
    }

    // In USD
    // Gets value of a single token in an address
    function getTokenValueInAddress(address tracked_address, address token_address, bool use_cr_logic) public view returns (uint256 value_usd_e18) {
        require(is_address_tracked[tracked_address], "Address not being tracked");
        OracleCRInfo memory thisOracleCRInfo = oracle_cr_infos[token_address];

        // Get value of raw ETH first
        if (token_address == address(0)){
            value_usd_e18 = (tracked_address.balance * ethUSDOracle.getETHPricePrecise()) / PRECISE_PRICE_PRECISION;
        }
        else {
            ( uint256 precise_price, ) = ComboOracle(thisOracleCRInfo.oracle_address).getTokenPrice(token_address);
            uint256 missing_decimals = uint256(18) - ERC20(token_address).decimals();

            // Scale up to E18
            uint256 value_to_add = (((ERC20(token_address).balanceOf(tracked_address) * (10 ** missing_decimals)) * precise_price) / (PRECISE_PRICE_PRECISION));
            
            // If applicable, multiply by the CR. Used for dollarBalances and collatDollarBalance tracking
            if (use_cr_logic && thisOracleCRInfo.use_cr){
                value_to_add = (value_to_add * getCR()) / PRICE_PRECISION;
            }

            value_usd_e18 += value_to_add;
        }
    }

    // In USD
    // Gets value of all the ETH and tracked tokens in an address
    function getValueInAddress(address tracked_address, bool use_cr_logic) public view returns (uint256 value_usd_e18) {
        require(is_address_tracked[tracked_address], "Address not being tracked");

        // Get token values
        address[] memory tracked_token_arr = tokens_for_address[tracked_address];
        for (uint i = 0; i < tracked_token_arr.length; i++){ 
            address the_token_addr = tracked_token_arr[i];
            value_usd_e18 += getTokenValueInAddress(tracked_address, the_token_addr, use_cr_logic);
        }
    }

    // In USD
    function getTotalValue(bool use_cr_logic) public view returns (uint256 value_usd_e18) {
        // Initialize
        value_usd_e18 = 0;

        // Loop through all of the tracked addresses
        for (uint i = 0; i < tracked_addresses.length; i++){ 
            if (tracked_addresses[i] != address(0)) {
                value_usd_e18 += getValueInAddress(tracked_addresses[i], use_cr_logic);
            }
        }
    }

    /* ========== PUBLICALLY CALLABLE ========== */

    function refreshCR() public {
        stored_cr = IFRAX.global_collateral_ratio();
    }
   
    /* ========== RESTRICTED GOVERNANCE FUNCTIONS ========== */

    function setAMOMinter(address _amo_minter_address) external onlyByOwnGov {
        amo_minter = IFraxAMOMinter(_amo_minter_address);

        // Get the custodian and timelock addresses from the minter
        custodian_address = amo_minter.custodian_address();
        timelock_address = amo_minter.timelock_address();

        // Make sure the new addresses are not address(0)
        require(custodian_address != address(0) && timelock_address != address(0), "Invalid custodian or timelock");
    }

    function toggleUseStoredCR() external onlyByOwnGovCust {
        use_stored_cr = !use_stored_cr;
    }

    // ---------------- Oracle Related ----------------

    function setTokenOracleCRInfo(address token_address, address oracle_address, bool use_cr) public onlyByOwnGov {
        // Make sure the oracle is valid
        ( uint256 precise_price, ) = ComboOracle(oracle_address).getTokenPrice(token_address);
        require(precise_price > 0, "Invalid Oracle");

        oracle_cr_infos[token_address].token_address = token_address;
        oracle_cr_infos[token_address].oracle_address = oracle_address;
        oracle_cr_infos[token_address].use_cr = use_cr;
    }

    function batchSetTokenOracleCRInfo(OracleCRInfo[] memory _oracle_cr_infos) public onlyByOwnGov {
        for (uint256 i = 0; i < _oracle_cr_infos.length; i++){ 
            OracleCRInfo memory thisOracle = _oracle_cr_infos[i];
            setTokenOracleCRInfo(thisOracle.token_address, thisOracle.oracle_address, thisOracle.use_cr);
        }
    }

    // ---------------- Tracked Address Related ----------------

    function toggleTrackedAddress(address tracked_address) public onlyByOwnGov {
        is_address_tracked[tracked_address] = !is_address_tracked[tracked_address];
    }

    function addTrackedAddress(address tracked_address) public onlyByOwnGov {
        for (uint i = 0; i < tracked_addresses.length; i++){ 
            if (tracked_addresses[i] == tracked_address) {
                revert("Address already present");
            }
        }

        // Add in the address
        is_address_tracked[tracked_address] = true;
        tracked_addresses.push(tracked_address);
    }

    function removeTrackedAddress(address tracked_address) public onlyByOwnGov {
        is_address_tracked[tracked_address] = false;

        // 'Delete' from the array by setting the address to 0x0
        for (uint i = 0; i < tracked_addresses.length; i++){ 
            if (tracked_addresses[i] == tracked_address) {
                tracked_addresses[i] = address(0); // This will leave a null in the array and keep the indices the same

                // Remove the tracked token entries too
                delete tokens_for_address[tracked_address];
                break;
            }
        }
    }

    // ---------------- Token Related ----------------

    function batchAddTokensForAddress(address tracked_address, address[] memory token_addresses) public onlyByOwnGov {
        for (uint i = 0; i < token_addresses.length; i++){ 
            addTokenForAddress(tracked_address, token_addresses[i]);
        }
    }

    function addTokenForAddress(address tracked_address, address token_address) public onlyByOwnGov {
        // Make sure the oracle info is present already
        require(oracle_cr_infos[token_address].oracle_address != address(0), "Add Oracle info first");

        address[] memory tracked_token_arr = tokens_for_address[tracked_address];
        for (uint i = 0; i < tracked_token_arr.length; i++){ 
            if (tracked_token_arr[i] == tracked_address) {
                revert("Token already present");
            }
        }

        tokens_for_address[tracked_address].push(token_address);
    }

    function removeTokenForAddress(address tracked_address, address token_address) public onlyByOwnGov {
        address[] memory tracked_token_arr = tokens_for_address[tracked_address];

        // 'Delete' from the array by setting the address to 0x0
        for (uint i = 0; i < tracked_token_arr.length; i++){ 
            if (tracked_token_arr[i] == token_address) {
                tokens_for_address[tracked_address][i] = address(0); // This will leave a null in the array and keep the indices the same
                break;
            }
        }
    }

    // ---------------- Other ----------------

    function recoverERC20(address tokenAddress, uint256 tokenAmount) external onlyByOwnGov {
        TransferHelper.safeTransfer(address(tokenAddress), msg.sender, tokenAmount);
    }

    // Generic proxy
    function execute(
        address _to,
        uint256 _value,
        bytes calldata _data
    ) external onlyByOwnGov returns (bool, bytes memory) {
        (bool success, bytes memory result) = _to.call{value:_value}(_data);
        return (success, result);
    }

}
