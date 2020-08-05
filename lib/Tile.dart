part of not_scrabble;

abstract class Tile {

	int tileCoordinate;
	Premium premium;

	Tile(int tileCoordinate, Premium premium) {
		this.tileCoordinate=tileCoordinate;
	}

	bool isTileOccupied();

}

class EmptyTile extends Tile {

	EmptyTile(int tileCoordinate, Premium premium) : super(tileCoordinate, premium);

  	@override
  	bool isTileOccupied() {
		return false;
	}
}

class OccupiedTile extends Tile {

	Piece piece;

	OccupiedTile(int tileCoordinate, Premium premium, Piece piece) : super(tileCoordinate, premium) {
		this.piece=piece;
	}

  	@override
  	bool isTileOccupied() {
		return true;
	}
	
	Piece getPieceOnTile() {
		return this.piece;
	}

}