part of not_scrabble;

abstract class Player {

	List<Piece> bag;
	int id;
	int score;
	List<OccupiedTile> move;

	Player(int id) {
		this.id=id;
		this.bag=NotScrabbleUtils.getNewPlayerBag();
		Scrabble.getGlobalBag().removeRange(0,7);
		this.score=0;
	}

	makeMove() {
		this.score = NotScrabbleUtils.calculatePoints(this.move);

		this.bag=NotScrabbleUtils.getNewPlayerBag();
		this.move.clear();
		Scrabble.endTurn();
	}
}

class HumanPlayer extends Player {

	HumanPlayer(int id) : super(id);
}

class AIPlayer extends Player {

	AIPlayer(int id) : super(id);
}