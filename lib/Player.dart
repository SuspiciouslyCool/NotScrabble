part of not_scrabble;

abstract class Player {

	List<Piece> bag;
	int id;
	int score;
	List<OccupiedTile> move;

	Player(int id) {
		this.id=id;
		this.bag=Scrabble.getGlobalBag().sublist(0,7);
		Scrabble.getGlobalBag().removeRange(0,7);
		this.score=0;
	}
}

class HumanPlayer extends Player {

	HumanPlayer(int id) : super(id);
}

class AIPlayer extends Player {

	AIPlayer(int id) : super(id);
}