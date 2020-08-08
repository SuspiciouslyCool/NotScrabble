part of not_scrabble;

class Scrabble {

	static List<Piece> globalBag = new List<Piece>(100);
	List<Tile> board;
	List<Player> players = new List<Player>(4);
	int currentPlayer=0;

	Scrabble(String lang, int humanPlayers, int aiPlayers) {
		// Generate Bag
		Scrabble.globalBag=ScrabbleUtils.generateBag(lang);
		
		// Generate Board
		for(int i=0; i<225; i++) {
			this.board.add(new EmptyTile(i));
		}

		// Generate Players
		for(int i=0; i<humanPlayers; i++) {
			this.players.add(new HumanPlayer(i));
		}
		for(int i=0; i<aiPlayers; i++) {
			this.players.add(new AIPlayer(i));
		}
	}

	static getGlobalBag() {
		return Scrabble.globalBag;
	}
}