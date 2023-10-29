// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract UserContext {
    // Mapping to store Aadhar numbers with user IDs
    mapping(uint256 => uint256) public aadharToUserId;

    // Mapping to store user IDs with context arrays
    mapping(uint256 => uint256[]) public userIdToContext;

    // Function to add a new mapping from Aadhar number to user ID
    function addAadharToUserId(uint256 aadhar, uint256 userId) public {
        require(aadharToUserId[aadhar] == 0, "Aadhar already mapped to a user");
        aadharToUserId[aadhar] = userId;
    }

    // Function to add context data to a user ID
    function addContextToUser(uint256 userId, uint256 contextData) public {
        userIdToContext[userId].push(contextData);
    }

    // Function to get the context data for a user ID
    function getContextForUser(uint256 userId) public view returns (uint256[] memory) {
        return userIdToContext[userId];
    }
}