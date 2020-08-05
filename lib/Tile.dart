part of not_scrabble;

abstract class Tile {

	int tileCoordinate;

	Tile(int tileCoordinate) {
		this.tileCoordinate=tileCoordinate;
	}

	bool isTileOccupied();

}

class EmptyTile extends Tile {

	EmptyTile(int tileCoordinate) : super(tileCoordinate);

  	@override
  	bool isTileOccupied() {
		return false;
	}
}

class OccupiedTile extends Tile {

	Piece piece;

	OccupiedTile(int tileCoordinate, Piece piece) : super(tileCoordinate) {
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