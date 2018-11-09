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

	//Winning Cases
	uint[][]  tests = [[0,1,2],[3,4,5],[6,7,8], [0,3,6],[1,4,7],[2,5,8], [0,4,8],[2,4,6]];
	
	function Status() returns(uint){
		for(uint i =0; i < 8;i++){
        		uint[] memory b = tests[i];
        		if(board[b[0]] != 0 && board[b[0]] == board[b[1]] && board[b[0]] == board[b[2]]) return board[b[0]];
    		}
	}

	function current() constant returns(string, string) {
	        string memory text = "No winner yet";
        	uint winner = Status();
        	if(winner == 1){
            		text = "Winner is X";
        	}
        	if (winner == 2){
            		text = "Winner is O";
        	}
        
        
        	bytes memory out = new bytes(11);
        	byte[] memory signs = new byte[](3);
       		signs[0] = "-";
        	signs[1] = "X";
        	signs[2] = "O";
        	bytes(out)[3] = "|";
        	bytes(out)[7] = "|";
        
        	for(uint i =0; i < 9;i++){
            		bytes(out)[i + i/3] = signs[board[i]];
        	}
        
        return (text, string(out));
    }
    

}
