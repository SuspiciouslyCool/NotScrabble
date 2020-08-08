part of not_scrabble;

abstract class Tile {

	int tileCoordinate;
	Premium premium;

	Tile(int tileCoordinate) {
		this.tileCoordinate=tileCoordinate;

		//get Premium
		const List<int> dlsCoordinate = [3,11,36,38,45,52,59,92,96,98,102,108,116,120,126,128,132,165,172,179,213,221];
		const List<int> tlsCoordinate = [20,24,76,80,84,88,136,140,144,148,200,204];
		const List<int> dwsCoordinate = [16,28,32,42,48,56,64,70,154,160,168,176,182,192,196,208];
		const List<int> twsCoordinate = [0,7,14,105,119,210,217,224];
		if(dlsCoordinate.contains(tileCoordinate)) {
			this.premium=Premium.DLS;
		} else if(tlsCoordinate.contains(tileCoordinate)) {
			this.premium=Premium.TLS;
		} else if(dwsCoordinate.contains(tileCoordinate)) {
			this.premium=Premium.DWS;
		} else if(twsCoordinate.contains(tileCoordinate)) {
			this.premium=Premium.TWS;
		} else {
			this.premium=Premium.NONE;
		}
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