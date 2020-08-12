part of not_scrabble;

class Scrabble {

	static List<Piece> globalBag = new List<Piece>(100);
	static Board board;
	static List<Player> players = new List<Player>(4);
	static int currentPlayer;

	Scrabble(String lang, int humanPlayers, int aiPlayers) {
		// Generate Bag
		Scrabble.globalBag=NotScrabbleUtils.generateBag(lang);
		
		Scrabble.board=new Board();

		// Generate Players
		for(int i=0; i<humanPlayers; i++) {
			Scrabble.players.add(new HumanPlayer(i));
		}
		for(int i=0; i<aiPlayers; i++) {
			Scrabble.players.add(new AIPlayer(i));
		}
	}

	static List<Piece> getGlobalBag() {
		return Scrabble.globalBag;
	}

	static void endTurn() {
		if(currentPlayer==players.length-1) {
			currentPlayer=0;
		} else {
			currentPlayer++;
		}
	}
}