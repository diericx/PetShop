pragma solidity ^0.4.17;

contract Adoption {
    address[16] public adopters;

    // Adopting a pet
    function adopt(uint petId) public returns (uint) {
        require(petId >= 0 && petId <= 15);

        adopters[petId] = msg.sender;

        return petId;
    }

    function sendPet(uint petId, address newOwner) public {
        require(newOwner != address(0));
        require(adopters[petId] == msg.sender);

        adopters[petId] = newOwner;
    }

    function getAdopters() public view returns (address[16]) {
        return adopters;
    }
}