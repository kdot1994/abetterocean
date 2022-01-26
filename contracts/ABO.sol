// SPDX-License-Identifier: GPL-3.0
// Solidity program to demonstrate
// how to create a contract
pragma solidity >=0.7.0 <0.9.0;

// Creating a contract
contract ABO {	
    // Declaring variable
    string public projectID;
    string public ngoID;
    string public donorID;
    string public contract_text;
    string public label;
    uint public contract_value;

    function ngo_create(string memory _projectID, string memory _ngoID, string memory _contract_text, string memory _label, uint memory _contract_value) public {
        projectID = _projectID;
        ngoID = _ngoID;
        contract_text = _contract_text;
        label = _label;
        projectID = _contract_value;
    }

    function greet() public view returns(string memory)  {
        return greeting;
    }
}