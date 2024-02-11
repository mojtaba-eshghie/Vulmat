// File: ../sc_datasets/DAppSCAN/QuillAudits-Yearn Finance-Yearn Protocol V1/yearn-protocol-9ff0dc0ea73642c529383d0675930a41bf033295/interfaces/yearn/Vault.sol

pragma solidity ^0.5.16;

interface Vault {
    function deposit(uint) external;
    function depositAll() external;
    function withdraw(uint) external;
    function withdrawAll() external;
    function getPricePerFullShare() external view returns (uint);
}
