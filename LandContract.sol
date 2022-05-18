pragma solidity ^0.5.11;

//global variables here

contract LandContractBatch7
{
    //This is the contract for adding Property 
    //State variables here
    //Fixed size variable - memory is fixed already 
    uint public totalLandsCounter = 0; //only number, integer
    // bool status; //hold either 0 or 1 value 
    // //Variable size - memory isnt fixed 
    // string name; 
    // uint ids[]; //[2,4,7,8]
    // ids[0] => 2
    // ids[1] => 4
    // ids[2] => 7
    // ids[0] => 2
    
    //user defined variable - struct, enum 

    //struct is to create table, land is table name, and columns names and var type below it 
    struct Land
    {
        address ethaddress;
        uint cost; 
        uint landId;
    }

    // Land public myLand = Land (0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 50, 1);
    // Land public myLand2 = Land (0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 100, 2);
    // Land public myLand3 = Land (0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 50, 3);

    //mapping (unit => string) public stumapping;
    mapping (address => Land[]) public ownedLands;
    //ownedLands [0x5B38Da6a701c568545dCfcB03FcB875f56beddC4][0] => (0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 50, 1)
    //ownedLands [0x5B38Da6a701c568545dCfcB03FcB875f56beddC4][1] => (0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 50, 1)

    //to get total land in contract
    function getNumberofLands() view public returns (uint)
    {
        return totalLandsCounter;
    }

    //Access control - only this address can invoke the add property function. Use IF function
    modifier isOwner
    {
            require(msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
            _;
    }

    //Add an event & write logs
    event Add(address _owner, uint _landId);


    //Add a new property - create incremental row, add data in row, push row to map
    function addProperty(address _ethAddress, uint _cost) public isOwner
    {
        totalLandsCounter = totalLandsCounter + 1; 
        Land memory myLand = Land({
            ethaddress: _ethAddress,
            cost: _cost,
            landId: totalLandsCounter
        });
        ownedLands[_ethAddress].push(myLand);
        emit Add(msg.sender, totalLandsCounter);
    }
}