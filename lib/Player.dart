part of not_scrabble;

abstract class Player {

	List<Piece> bag;
	int id;
	int score;
	List<OccupiedTile> move;

	Player(int id) {
		this.id=id;
		this.bag=ScrabbleUtils.getNewPlayerBag();
		Scrabble.getGlobalBag().removeRange(0,7);
		this.score=0;
	}

	makeMove() {
		//TODO: 
		// Calculate points

		this.bag=ScrabbleUtils.getNewPlayerBag();
		this.move.clear();
	}
}

class HumanPlayer extends Player {

	HumanPlayer(int id) : super(id);
}

class AIPlayer extends Player {

	AIPlayer(int id) : super(id);
}