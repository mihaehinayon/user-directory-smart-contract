# User Directory Smart Contract

A Solidity smart contract that allows users to register and manage their profile information on the blockchain.

## Features

- **User Registration**: Users can register with their name, age, and country of origin
- **Profile Updates**: Registered users can update their profile information
- **Profile Lookup**: Anyone can view user profiles by wallet address
- **Duplicate Prevention**: Users cannot register twice
- **Timestamp Tracking**: Registration time is automatically recorded

## Contract Structure

### User Struct
```solidity
struct User {
    string fullName;
    uint age;
    string countryOfOrigin;
    uint registrationTime;
}
```

### Functions

#### `register(string memory _name, uint _age, string memory _country)`
- Allows new users to register their profile
- Validates that user hasn't already registered
- Automatically records registration timestamp

#### `updateProfile(string memory _name, uint _age, string memory _country)`
- Allows registered users to update their profile information
- Validates that user is already registered
- Preserves original registration timestamp

#### `getProfile(address _userAddress)` (view function)
- Returns the profile information for a given wallet address
- Validates that the user exists
- Free to call (no gas cost)

## Assignment Requirements Met

✅ Create register(), updateProfile(), getProfile() functions  
✅ Use a struct named User  
✅ Store data in state variables  
✅ Include public getter function  
✅ Validate that user cannot register twice  
✅ Add a view function to fetch user info  
✅ Track registration timestamp using uint  

## Usage Example

1. **Register**: `register("Alice", 25, "Canada")`
2. **Update**: `updateProfile("Alice Smith", 26, "Canada")`
3. **View**: `getProfile(0x123...)` returns Alice's profile

## Technical Notes

- Built with Solidity ^0.8.0
- Uses mapping for efficient address-to-user lookups
- Implements proper validation and error handling
- Gas-optimized with view functions for reads

## Repository

This smart contract was created as part of a blockchain development workshop assignment.