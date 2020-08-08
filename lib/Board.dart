part of not_scrabble;

class Board {

	List<Tile> board;

	Board() {
		// Generate Board
		for(int i=0; i<225; i++) {
			this.board.add(new EmptyTile(i));
		}
	}

	getTile(int tileCoordinate) {
		return this.board[tileCoordinate];
	}

	placePiece(int tileCoordinate, Piece piece, Player player) {
		Tile tile = new OccupiedTile(tileCoordinate, piece);
		this.board[tileCoordinate] = tile;
		player.move.add(tile);
	}
}