pragma solidity ^0.4.17;

contract Lottery {
    
    address public manager;
    address[] public players;
    
    function Lottery() public {
        // msg - global variable
        manager = msg.sender;
    }
    
    function enter() public payable {
        // payable keyword is here coz we are receiving some ether
        // require is used for validation - a boolean exp
        // .01 "ether" will convert the amount to wei automatically
        require(msg.value > .01 ether);
        players.push(msg.sender);
    }
    
    function random() private view returns (uint) {
        return uint(keccak256(block.difficulty, now, players));
    }
    
    function pickWinner() public restricted {
        uint index = random() % players.length;

        // transfer - global variable
        players[index].transfer(address(this).balance);
        
        // resetting array
        players = new address[](0);
    }
    
    modifier restricted() {
        // nobody can call pickWinner unless its manager
        require(msg.sender == manager);
        _;
    }
    
    function getPlayers() public view returns (address[]) {
        return players;
    }
    
   
}
