pragma solidity^0.4.0;

contract tictactoe{
	uint[] board = new uint[](9);
	address p1;
	address p2;
	uint start = 0;

	function TicTacToe(){
		p1 = msg.sender;
	}

	function JoinGame(){
		p2 = msg.sender;
	}

	function DoMove(uint){
	
	}
}
