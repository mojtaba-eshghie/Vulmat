// File: ../sc_datasets/DAppSCAN/Iosiro-Synthetix Fomalhaut Release Smart Contract Audit/synthetix-95d73f7b74483e72fffe1f8ee90f037a2f7b8773/legacy/common/IERC20.sol

pragma solidity 0.4.25;


contract IERC20 {
    function totalSupply() public view returns (uint);

    function balanceOf(address owner) public view returns (uint);

    function allowance(address owner, address spender) public view returns (uint);

    function transfer(address to, uint value) public returns (bool);

    function approve(address spender, uint value) public returns (bool);

    function transferFrom(
        address from,
        address to,
        uint value
    ) public returns (bool);

    // ERC20 Optional
    function name() public view returns (string);

    function symbol() public view returns (string);

    function decimals() public view returns (uint8);

    event Transfer(address indexed from, address indexed to, uint value);

    event Approval(address indexed owner, address indexed spender, uint value);
}
