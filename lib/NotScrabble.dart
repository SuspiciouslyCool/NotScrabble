part of not_scrabble;

class NotScrabble {

	static List<Piece> globalBag = new List<Piece>(100);
	static Board board;
	static List<Player> players = new List<Player>(4);
	static int currentPlayer;

	NotScrabble(String lang, int humanPlayers, int aiPlayers) {
		// Generate Bag
		NotScrabble.globalBag=Utils.generateBag(lang);
		
		NotScrabble.board=new Board();

		// Generate Players
		for(int i=0; i<humanPlayers; i++) {
			NotScrabble.players.add(new HumanPlayer(i));
		}
		for(int i=0; i<aiPlayers; i++) {
			NotScrabble.players.add(new AIPlayer(i));
		}
	}

	static List<Piece> getGlobalBag() {
		return NotScrabble.globalBag;
	}

	static void endTurn() {
		if(currentPlayer==players.length-1) {
			currentPlayer=0;
		} else {
			currentPlayer++;
		}
	}
}