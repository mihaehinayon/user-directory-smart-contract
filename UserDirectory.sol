// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserDirectory {
    struct User {
        string fullName;
        uint age;
        string countryOfOrigin;
        uint registrationTime;
    }
    
    mapping(address => User) users;
    
    function register(
        string memory _name,
        uint _age,
        string memory _country
    ) public {
        require(bytes(users[msg.sender].fullName).length == 0, "User already registered");
        
        users[msg.sender] = User({
            fullName: _name,
            age: _age,
            countryOfOrigin: _country,
            registrationTime: block.timestamp
        });
    }
    
    function updateProfile(
        string memory _name,
        uint _age,
        string memory _country
    ) public {
        require(bytes(users[msg.sender].fullName).length > 0, "User not registered");
        
        users[msg.sender] = User({
            fullName: _name,
            age: _age,
            countryOfOrigin: _country,
            registrationTime: users[msg.sender].registrationTime
        });
    }
    
    function getProfile(address _userAddress) public view returns (User memory) {
        require(bytes(users[_userAddress].fullName).length > 0, "User not found");
        return users[_userAddress];
    }
}