// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Donation{
    address public owner;
    address beneficiary; 
    bool public emergencyStopped;

    struct DonationFund {
        address donor;
        uint256 amount;
        string message;
        uint256 timestamp;
    }

    DonationFund [] public donations; 
    mapping (address => bool) donors;
    uint256 public totalDonations;

    modifier onlyOwner {
        require(owner == msg.sender, "Only the owner can execute this function.");
        _;
    }
    
    constructor(address _beneficiary){
        owner = msg.sender;
        beneficiary = _beneficiary;
    }

    function donate(string memory _message) external payable{
        require(!emergencyStopped, "Contract is in emergency stop mode!");
        require(msg.value > 0, "Donation amount must be greater than 0");
        donations.push(DonationFund(msg.sender, msg.value, _message, block.timestamp));
        donors[msg.sender] = true;
        totalDonations += msg.value;
    }

    function viewTotalDonations() external view returns (uint256) {
        return totalDonations;
    } 
}