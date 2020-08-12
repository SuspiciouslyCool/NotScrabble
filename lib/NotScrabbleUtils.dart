part of not_scrabble;

class NotScrabbleUtils {

	static List<Piece> generateBag(String lang) {
		File file = new File("./lang/$lang.json");
		String fileAsString = file.readAsStringSync();
		List<dynamic> json  = jsonDecode(fileAsString);
		List<Piece> pieceList=new List<Piece>();
		for(int i=0; i<json.length;i++) {
			dynamic entry = json[i];
			for(int j=0; j<entry["amount"];j++) {
				pieceList.add(new Piece(entry["letter"],entry["score"]));
			}
		}
		return pieceList..shuffle();
	}

	static List<Piece> getNewPlayerBag() {
		return Scrabble.getGlobalBag().sublist(0,7);
	}

	static isLegalTile(int tileCoordinate) {
		return tileCoordinate>=0&&tileCoordinate<225;
	}

	static int calculatePoints(List<OccupiedTile> move) {
		List<int> directions = [-15,-1,1,15];
		int totalScore=0;
		List<Tile> visited;
		for(Tile tile in move) {
			for(int directionOffset in directions) {
				int index=0;
				int wordScore=0;
				int premiumModifier=1;
				int candidateCoordinate = tile.tileCoordinate+directionOffset*index;

				if(isLegalTile(candidateCoordinate)) {
					if((candidateCoordinate%15==0&&directionOffset==-1) || (candidateCoordinate+1%15==0&&directionOffset==1)) {
						continue;
					}
				} else {
					continue;
				}

				OccupiedTile candidateTile = Scrabble.board.getTile(candidateCoordinate);
				while(!candidateTile.isTileOccupied()) {
					
					if(!visited.contains(candidateTile)) {
						visited.add(candidateTile);

						if(move.contains(candidateTile)) {
							switch (candidateTile.premium) {
								case Premium.DWS:
									premiumModifier*=2;
									break;
								case Premium.TWS:
									premiumModifier*=3;
									break;
								case Premium.DLS:
									wordScore+=candidateTile.getPieceOnTile().score*2;
									break;
								case Premium.TLS:
									wordScore+=candidateTile.getPieceOnTile().score*3;
									break;
								default:
									wordScore+=candidateTile.getPieceOnTile().score;
									break;
							}
						} else {
							wordScore+=candidateTile.getPieceOnTile().score;
						}
					}
					index++;
					candidateCoordinate = tile.tileCoordinate+directionOffset*index;
					candidateTile = Scrabble.board.getTile(candidateCoordinate);
				}
				totalScore+=wordScore*premiumModifier;
			}
		}


		return totalScore;
	}
}