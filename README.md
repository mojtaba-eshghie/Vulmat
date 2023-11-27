## Vulnerability detection results that should be used in conjunction

If the vulneraiblity detected by two tools refers to the same function or same line (depending on detection results) and same type of vulnerability, they should be considered together (for comparison/benchmarking).

## Detection relationship categorization

<table style="border-collapse: collapse; width: 100%;">
  <tr>
    <th rowspan="2"><b>N</b></th>
    <th rowspan="2"><b>Assigned general category</b></th>
    <th colspan="4" style="text-align: center;"><b>Detectors and Applications</b></th>
  </tr>
  <tr>
    <th style="text-align: center;"><b style="text-align: center;">Target Applications</b></th>
    <th style="text-align: center;"><b>Slither</b></th>
    <th style="text-align: center;"><b>Smartcheck</b></th>
    <th style="text-align: center;"><b>Semgrep</b></th>
  </tr>

<!-- row 1 -->
  <tr>
    <td rowspan="10" style="text-align: center; border-bottom: 2px solid black;">1</td>
    <td rowspan="10" style="text-align: center; border-bottom: 2px solid black;">Re-entrancy</td>
    <td style="text-align: center;">DeFi</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Compound-borrowfresh-reentrancy</td>
  </tr>
  <tr>
    <td style="text-align: center;">Tokenization</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Erc721-reentrancy</td>
  </tr>
  <tr>
    <td style="text-align: center;">DeFi</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Curve-readonly-reentrancy</td>
  </tr>
  <tr>
    <td style="text-align: center;">Tokenization</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Erc777-reentrancy</td>
  </tr>

  <tr>
    <td style="text-align: center;">Tokenization</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">erc677-reentrancy</td>
  </tr>

  <tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Reentrancy-benign</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
  </tr>

  <tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Reentrancy-events</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
  </tr>

  <tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Reentrancy-no-eth</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
  </tr>

  <tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">reentrancy-unlimited-gas</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
  </tr>
  <tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">reentrancy-eth</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
  </tr>

<!-- row 2 -->

  <tr>
    <td rowspan="2" style="text-align: center; border-bottom: 2px solid black;">2</td>
    <td rowspan="2" style="text-align: center; border-bottom: 2px solid black;"><a href="#low-level-calls">Low-level calls</a></td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Arbitrary-low-level-call</td>
  </tr>

<tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">SOLIDITY_CALL_WITHOUT_DATA</td>
    <td style="text-align: center;">N/A</td>

  </tr>

  <!-- row 3 -->

<tr>
    <td rowspan="10" style="text-align: center; border-bottom: 2px solid black;">3</td>
    <td rowspan="10" style="text-align: center; border-bottom: 2px solid black;">Access Control</td>
    <td style="text-align: center;">DeFi</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Compound-sweeptoken-not-restricted</td>
  </tr>

  <tr>
    <td style="text-align: center;">Tokenization</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Erc20-public-burn</td>
  </tr>

  <tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Accessible-selfdestruct</td>
  </tr>

  <tr>
    <td style="text-align: center;">DeFi</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Oracle-price-update-not-restricted</td>
  </tr>

  <tr>
    <td style="text-align: center;">DeFi</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Uniswap-callback-not-protected</td>
  </tr>

  <tr>
    <td style="text-align: center;">Tokenization</td>
    <td style="text-align: center;">arbitrary-send-erc20</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
  </tr>

  <tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">arbitrary-send-eth</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
  </tr>

  <tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">suicidal</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
  </tr>

  <tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">arbitrary-send-erc20-permit</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
  </tr>

  <tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">SOLIDITY_TX_ORIGIN</td>
    <td style="text-align: center;">N/A</td>
  </tr>

   <!-- row 4 -->

<tr>
    <td rowspan="2" style="text-align: center; border-bottom: 2px solid black;">4</td>
    <td rowspan="2" style="text-align: center; border-bottom: 2px solid black;">Delegation</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">controlled-delegatecall</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Delegatecall-to-arbitrary-address</td>
</tr>

  <tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">delegatecall-loop</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
  </tr>

<!-- row 5 -->

<tr>
    <td rowspan="2" style="text-align: center; border-bottom: 2px solid black;">5</td>
    <td rowspan="2" style="text-align: center; border-bottom: 2px solid black;">Arithmetic</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Basic-arithmetic-underflow</td>
</tr>

<tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">divide-before-multiply</td>
    <td style="text-align: center;">SOLIDITY_DIV_MUL</td>
    <td style="text-align: center;">N/A</td>
  </tr>

<!-- row 6 -->

<tr>
    <td rowspan="1" style="text-align: center; border-bottom: 2px solid black;">6</td>
    <td rowspan="1" style="text-align: center; border-bottom: 2px solid black;">Oracle Manipulation</td>
    <td style="text-align: center;">DeFi</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Keeper-network-oracle-manipulation</td>
</tr>

<!-- row 7 -->

<tr>
    <td rowspan="1" style="text-align: center; border-bottom: 2px solid black;">7</td>
    <td rowspan="1" style="text-align: center; border-bottom: 2px solid black;"> Input Validation </td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Missing-zero-check</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
</tr>

<!-- row 8 -->

<tr>
    <td rowspan="3" style="text-align: center; border-bottom: 2px solid black;">8</td>
    <td rowspan="3" style="text-align: center; border-bottom: 2px solid black;"> Shadowing </td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Shadowing-local</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
</tr>

  <tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">shadowing-state</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
  </tr>

  <tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">shadowing-abstract</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
  </tr>

<!-- row 9 -->

<tr>
    <td rowspan="2" style="text-align: center; border-bottom: 2px solid black;">9</td>
    <td rowspan="2" style="text-align: center; border-bottom: 2px solid black;"> Compliance </td>
    <td style="text-align: center;">Tokenization</td>
    <td style="text-align: center;">Erc20-interface</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
</tr>
<tr>
    <td style="text-align: center;">Tokenization</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">SOLIDITY_ERC20_TRANSFER_SHOULD_THROW</td>
    <td style="text-align: center;">N/A</td>
</tr>

<!-- row 10 -->

<tr>
    <td rowspan="2" style="text-align: center; border-bottom: 2px solid black;">10</td>
    <td rowspan="2" style="text-align: center; border-bottom: 2px solid black;"> Timestamp </td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">timestamp</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
</tr>

<tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">weak-prng</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
</tr>

<!-- row 11 -->

<tr>
    <td rowspan="2" style="text-align: center; border-bottom: 2px solid black;">11</td>
    <td rowspan="2" style="text-align: center; border-bottom: 2px solid black;"> Initialization </td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">uninitialized-local</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
</tr>
<tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">uninitialized-state</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
  </tr>

<!-- row 12 -->

<tr>
    <td rowspan="3" style="text-align: center; border-bottom: 2px solid black;">12</td>
    <td rowspan="3" style="text-align: center; border-bottom: 2px solid black;"> Poor Logic Flaws </td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">Incorrect-equality</td>
    <td style="text-align: center;">SOLIDITY_EXACT_TIME, <br/>SOLIDITY_BALANCE_EQUALITY</td>
    <td style="text-align: center;">N/A</td>
</tr>
<tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">boolean-cst</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
  </tr>

  <tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">incorrect-use-of-blockhash</td>
  </tr>

<!-- row 13 -->

<tr>
    <td rowspan="3" style="text-align: center; border-bottom: 2px solid black;">13</td>
    <td rowspan="3" style="text-align: center; border-bottom: 2px solid black;"> Denial of Service </td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">locked-ether</td>
    <td style="text-align: center;">SOLIDITY_LOCKED_MONEY</td>
    <td style="text-align: center;">N/A</td>
</tr>

  <tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">calls-loop</td>
    <td style="text-align: center;">SOLIDITY_TRANSFER_IN_LOOP</td>
    <td style="text-align: center;">N/A</td>
  </tr>

<tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">msg-value-loop</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
  </tr>

<!-- row 14 -->

<tr>
    <td rowspan="1" style="text-align: center; border-bottom: 2px solid black;">14</td>
    <td rowspan="1" style="text-align: center; border-bottom: 2px solid black;"> <a href="#state-corruption">State Corruption</a> </td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">controlled-array-length</td>
    <td style="text-align: center;">SOLIDITY_ARRAY_LENGTH_MANIPULATION</td>
    <td style="text-align: center;">N/A</td>
</tr>

<!-- row 15 -->

<tr>
    <td rowspan="1" style="text-align: center; border-bottom: 2px solid black;">15</td>
    <td rowspan="1" style="text-align: center; border-bottom: 2px solid black;"> <a href="#function-behavior">Function Behavior</a> </td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">incorrect-modifier</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
</tr>

<!-- row 16 -->

<tr>
    <td rowspan="2" style="text-align: center; border-bottom: 2px solid black;">16</td>
    <td rowspan="2" style="text-align: center; border-bottom: 2px solid black;"> <a href="#transaction-validation">Transaction Validation</a> </td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">unchecked-transfer</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
</tr>

<tr>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">unchecked-lowlevel</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">N/A</td>
</tr>

<!-- row 17 -->

<tr>
    <td rowspan="1" style="text-align: center; border-bottom: 2px solid black;">17</td>
    <td rowspan="1" style="text-align: center; border-bottom: 2px solid black;"> Front-Running </td>
    <td style="text-align: center;">Tokenization</td>
    <td style="text-align: center;">N/A</td>
    <td style="text-align: center;">SOLIDITY_ERC20_APPROVE</td>
    <td style="text-align: center;">N/A</td>
</tr>

</table>

## General Category Descriptions

<a id="state-corruption"></a>

### State Corruption

The contract state is corrupted or manipulated in unintended ways.

<a id="function-behavior"></a>

### Function Behavior

This category would encompass concerns related to the behavior and flow of execution within smart contract functions, including the use of modifiers.

<a id="transaction-validation"></a>

### Transaction Validation

The core issue here is ensuring that transactions (especially token transfers) are executed as intended and their outcomes are validated.
Proper handling of external calls (transfer, transferFrom, etc.) and checking their return values, which is a key aspect of transaction handling in smart contract development.

<a id="low-level-calls"></a>

### Low-level Calls

This category is concerned with the way low-level calls are made. Especially, it concerns the way `data` field of the call is assigned (data source, being checked, etc.).

## Notes

- **N/A for target application**: This means the vulnerability does not pertain to a specific high-level application category.

## References

[The function SHOULD throw if the message caller’s account balance does not have enough tokens to spend.](https://eips.ethereum.org/EIPS/eip-20)
