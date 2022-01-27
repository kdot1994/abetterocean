// SPDX-License-Identifier: GPL-3.0
// Solidity program to demonstrate
// how to create a contract
pragma solidity >=0.7.0 <0.9.0;
pragma abicoder v2;
// Creating a contract
contract ABO {	
    // Declaring variable
    address public betterOcean = 0x86D15B422D924D9115986Dd7A87ee794CAF2cbaF;
    mapping (address => bool) public ngoWallets;
    mapping (uint => abo_contract) public projectIdToContract;
    uint public nextProjectId = 0;
    uint public aboFeeInPercent = 2;


    struct abo_contract{
        uint projectID;
        address ngoAddress;
        address donorAddress;
        uint donation;
        string pointer;
        //bool paid;
        //string label;
    }

    // abo_contract[] public abo_contracts;

    modifier isBetterOcean() {
        require(msg.sender == betterOcean);
        _;
    }

    modifier isValidNgo() {
        require(ngoWallets[msg.sender]);
        _;
    }

    function whitelistNgo(address _ngoAddress) isBetterOcean public {
        ngoWallets[_ngoAddress] = true;
    }

    function createContract(uint _donation, string memory _pointer) isValidNgo public {
        uint projectId = nextProjectId++;
        projectIdToContract[projectId] = abo_contract(projectId, msg.sender, address(0), _donation, _pointer);
    }

    function donate(uint _projectId) public payable{
        require(msg.value == projectIdToContract[_projectId].donation);
        address ngoAddress  = projectIdToContract[_projectId].ngoAddress;        
        uint aboFee = msg.value * aboFeeInPercent / 100; 
        uint ngoAmount = msg.value - aboFee; 
        // make a payment to NGO
        payable(ngoAddress).transfer(ngoAmount);
        // make a payment ABO
        payable(betterOcean).transfer(aboFee);
        abo_contract storage myContract = projectIdToContract[_projectId];
        myContract.donorAddress = msg.sender;
    } 


    function getContracts() public view returns (abo_contract[] memory) {
        abo_contract [] memory memoryArray = new abo_contract[](nextProjectId);
        for(uint i = 0; i < nextProjectId; i++) {
            memoryArray[i] = projectIdToContract[i];
        }
        return memoryArray;
    }

    // function getContract(uint _index) public view returns (abo_contract memory) {
    //     return abo_contracts[_index];
    // }

    function getNextProjectId() public view returns (uint) {
        return nextProjectId;
    }

    // function check_whitelistNgo(address _ngoAddress) isBetterOcean public returns (bool){
    //     return ngoWallets[_ngoAddress];
    // }

    // function ngo_create(string memory _projectID, address _ngoID, string memory _donorID, string memory _contract_text, string memory _label, uint _contract_value, bool _contract_valid, bool _contract_finished) public {
    //     abo_contracts.push(abo_contract(_projectID, _ngoID, _donorID, _contract_text, _label, _contract_value, _contract_valid, _contract_finished));
    // }

    // function donor_accept(string memory _projectID, address _ngoID, string memory _donorID, string memory _contract_text, string memory _label, uint _contract_value, bool _contract_valid, bool _contract_finished) public payable{
    //     require(msg.value >= 10 ether);

    //     abo_contracts.push(abo_contract(_projectID, _ngoID, _donorID, _contract_text, _label, _contract_value, _contract_valid, _contract_finished)); //needs to modify not create new
    //     // actua; payment
    // }

    // function allcontracts() public view returns(abo_contract[] memory) {
    //     return abo_contracts;
    // }

    // function getUser(string memory _projectID) public view returns (string memory) {
    //     return abo_contracts[_projectID].projectID;
    // }
//     function transferC() external payable{
//         }
    
//     function transfer(address payable _receiver) external {
//         _receiver.transfer(10 ether);
//   }
}