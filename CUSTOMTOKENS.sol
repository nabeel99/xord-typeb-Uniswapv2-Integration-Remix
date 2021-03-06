// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.3.0/contracts/token/ERC20/ERC20.sol";
contract Token1 is ERC20 {
    constructor(uint256 initialSupply) ERC20("Token1", "TK1") {
        _mint(msg.sender, initialSupply);
    }
}
contract Token2 is ERC20 {
    constructor(uint256 initialSupply) ERC20("Token2", "TK2") {
        _mint(msg.sender, initialSupply);
    }
}
