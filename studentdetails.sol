 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;
contract RedoTask{

struct studentDetail  { 
    string name;
    string class;
    uint age;
    uint favNum;
}
address public admin;
// create more than 1 admin
// allow only owner to add and remove admin 





mapping(address => studentDetail) public sDetails;
 // Maps are created with the syntax mapping(keyType => valueType) 

 constructor () {
     admin = msg.sender;

 }

 modifier onlyadmin(){
      require(msg.sender == admin, "You are not an admin");
        _;
        // Rem to put the above _; when writing modifier. its called placeholder.  
 }
// function that can change admin in a code.
 function newAdmin (address _newAdmin) public onlyadmin {
     admin = _newAdmin; 
 }
function mystudent( address _addr, string memory _class, string memory _name, uint _favNum, uint _age) public onlyadmin {
    studentDetail storage newStudentDetails = sDetails [_addr];
     // first assign the struct to a new variable, then assign it to the mapping(sdtails[addr]
    newStudentDetails.name = _name;
    newStudentDetails.class = _class;
    newStudentDetails.age = _age;
    newStudentDetails.favNum = _favNum;
}

}
