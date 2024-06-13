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
