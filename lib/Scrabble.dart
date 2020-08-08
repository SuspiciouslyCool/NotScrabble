part of not_scrabble;

class Scrabble {

	static List<Piece> globalBag = new List<Piece>(100);
	Board board;
	List<Player> players = new List<Player>(4);
	int currentPlayer=0;

	Scrabble(String lang, int humanPlayers, int aiPlayers) {
		// Generate Bag
		Scrabble.globalBag=ScrabbleUtils.generateBag(lang);
		
		this.board=new Board();

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