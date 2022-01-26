// SPDX-License-Identifier: GPL-3.0
// Solidity program to demonstrate
// how to create a contract
pragma solidity >=0.7.0 <0.9.0;

// Creating a contract
contract Greeter {	
    // Declaring variable
    string public greeting;

    function Greeter1() public {
        greeting = 'Hello';
    }

    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }

    function greet() public view returns(string memory)  {
        return greeting;
    }
}