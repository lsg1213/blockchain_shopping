pragma solidity >=0.5.0 <0.7.0;


contract shopping{
    address owner;
    string name;
    uint32 limit;
    uint32 people_num;
    
    mapping(uint32=>address) public list;
    
    uint32 list_num;
    
    constructor (string memory _name, uint32 _limit, uint32 _people_num) public {
        owner = msg.sender;
        name = _name;
        limit = _limit;
        people_num = _people_num;
    }
    
    function check_staking() public view returns(uint32) {
        return limit / people_num;
    }
    
    function staking() public payable {
        require(people_num > list_num);
        require(msg.value == limit / people_num);
        list[list_num] = msg.sender;
        list_num++;
    }
    
    function money() public view returns(uint){
        return address(this).balance;
    }
    
    function destroy() public {
        require(owner == msg.sender);
        
        selfdestruct(msg.sender);
    }
    
    function() payable external {}
}
