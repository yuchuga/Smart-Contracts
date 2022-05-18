pragma solidity ^0.5.11;
contract PeopleContractBatch7
{
    uint public totalPeopleCounter = 0; 
    struct People
    {
        address ethaddress;
        uint id; 
        string first_name;
        string last_name;
    }

    // People public Person1 = People(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 1, "Test", "test");
    // People public Person2 = People(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, 2, "YY", "Ng");
    // People public Person3 = People(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 2, "XY", "Tan");

    mapping (address => People[]) public __peopleMapping;
    
    function getNumberofPeople() view public returns (uint)
    {
        return totalPeopleCounter;
    }

    modifier isAdmin
    {
            require(msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
            _;
    }

    //use memory for temporary variable names to string data structures
    function addPeople(address _ethAddress, string memory _firstName, string memory _lastName) public isAdmin
    {
        totalPeopleCounter = totalPeopleCounter + 1; 

        People memory oneperson = People({
            ethaddress: _ethAddress,
            id: totalPeopleCounter,
            first_name: _firstName,
            last_name: _lastName
        });
        __peopleMapping[_ethAddress].push(oneperson);
    }
}
