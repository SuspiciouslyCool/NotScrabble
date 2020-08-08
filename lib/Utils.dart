part of not_scrabble;

class ScrabbleUtils {

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
}