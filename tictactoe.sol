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


	function DoMove(uint place) returns (string){
        
       		uint winner = Status();

        	if(winner == 1){
            		return "Winner is X";
        	}
       		if (winner == 2){
           		return " Winner is O";
        	}
        	if(start == 0){
            		if(msg.sender != p1) return "player 1's Turn";
        	}else if(start == 1){
            		if(msg.sender != p2) return "player 2's Turn";
        	}
        
        	if(place < 0 || place >= 9) return "Invalid Number  Enter number [0,9)";
        
        	if(board[place] != 0) return "already occupied";
        
        	board[place] = start+1;
        	start = 1- start;
        
        
        	return "Works Fine";   
    	}


	function Status() returns(uint){
		
		
	}

}
