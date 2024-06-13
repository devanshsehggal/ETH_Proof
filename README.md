# ETH PROOF Project

This repository contains a simple Solidity contract for a custom token named "Devansh_Sehgal_Token" (DST). The contract allows for minting and burning of tokens, managing the total supply and balances of addresses.

## Contract Overview

The contract implements the following features:
- Public variables to store token details.
- Mapping to keep track of address balances.
- Function to mint new tokens.
- Function to burn existing tokens.

## Contract Details

### Token Information
- **Token Name:** Devansh_Sehgal_Token
- **Token Abbreviation:** DST
- **Total Supply:** Initially 0, can be increased by minting tokens.

### Functions
1. **mint(address addr, uint amount)**
   - Mints new tokens to the specified address.
   - Increases the total supply by the specified amount.
   - Increases the balance of the specified address by the same amount.

2. **burn(address addr, uint amount)**
   - Burns tokens from the specified address.
   - Decreases the total supply by the specified amount.
   - Decreases the balance of the specified address by the same amount.
   - Ensures the address has enough balance before burning tokens.

## Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

contract MyToken {
    // Token details
    string public constant tokenName = "Devansh_Sehgal_Token";
    string public constant tokenAbbrv = "DST";
    
    // Total supply of the token
    uint public totalSupply = 0;
     
    // Mapping to store balances of each address
    mapping(address => uint) public balances;

    // Function to mint new tokens
    function mint(address addr, uint amount) public {
        totalSupply += amount;
        balances[addr] += amount;
    }

    // Function to burn existing tokens
    function burn(address addr, uint amount) public {
        if (balances[addr] >= amount) {
            totalSupply -= amount;
            balances[addr] -= amount;
        }
    }
}
```

## Getting Started

### Prerequisites
- Solidity compiler version 0.8.18 or later.

### Installing

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/devansh_sehgal_token.git
    ```

2. Navigate to the project directory:
    ```bash
    cd devansh_sehgal_token
    ```

3. Compile the contract:
    ```bash
    solc --optimize --bin --abi MyToken.sol -o build
    ```

## Usage

- Deploy the `MyToken` contract to an Ethereum network using your preferred method (Remix, Truffle, Hardhat, etc.).
- Use the `mint` function to create new tokens and assign them to addresses.
- Use the `burn` function to destroy tokens from specified addresses, reducing their balance and the total supply.
