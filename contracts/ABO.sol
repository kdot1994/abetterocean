// SPDX-License-Identifier: GPL-3.0
// Solidity program to demonstrate
// how to create a contract
pragma solidity >=0.7.0 <0.9.0;
pragma abicoder v2;
// Creating a contract
contract ABO {	
    // Declaring variable
    string public projectID;
    string public ngoID;
    string public donorID;
    string public contract_text;
    string public label;
    uint public contract_value;
    mapping(uint => abo_contract) projectIdToContract;

    struct abo_contract{
        string projectID;
        address ngoID;
        string donorID;
        string contract_text;
        string label;
        uint contract_value;
        bool contract_valid;
        bool contract_finished;
    }

    abo_contract[] public abo_contracts;


    function ngo_create(string memory _projectID, address _ngoID, string memory _donorID, string memory _contract_text, string memory _label, uint _contract_value, bool _contract_valid, bool _contract_finished) public {
        abo_contracts.push(abo_contract(_projectID, _ngoID, _donorID, _contract_text, _label, _contract_value, _contract_valid, _contract_finished));
    }

    function donor_accept(string memory _projectID, address _ngoID, string memory _donorID, string memory _contract_text, string memory _label, uint _contract_value, bool _contract_valid, bool _contract_finished) public payable{
        require(msg.value >= 10 ether);

        abo_contracts.push(abo_contract(_projectID, _ngoID, _donorID, _contract_text, _label, _contract_value, _contract_valid, _contract_finished)); //needs to modify not create new
        // actua; payment
    }

    function allcontracts() public view returns(abo_contract[] memory) {
        return abo_contracts;
    }

    // function getUser(string memory _projectID) public view returns (string memory) {
    //     return abo_contracts[_projectID].projectID;
    // }
    function transferC() external payable{
        }
    
    function transfer(address payable _receiver) external {
        _receiver.transfer(10 ether);
  }
}