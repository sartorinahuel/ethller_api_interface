part of ethller_api_interface;

class AppCoinRepository extends CoinsRepository {
  @override
  Future<Coin> getCoinById(String id) async {
    try {
      final searchedCoin = coins.firstWhere((element) => element.uuid == id);
      return searchedCoin;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<History> getCoinPriceById(String id) async {
    //Esto esta asi hasta que haya una DB propia a donde consultar. Ahora es redundante.
    try {
      return await coinAPIRepo.getCoinPriceById(id);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<History> getCoinPriceByIdAndTimeStamp(String id, int timeStamp) async {
    //Esto esta asi hasta que haya una DB propia a donde consultar. Ahora es redundante.
    try {
      return await coinAPIRepo.getCoinPriceByIdAndTimeStamp(id, timeStamp);
    } catch (_) {
      rethrow;
    }
  }

  @override
  //Se ignora el return ya que se saca la data desde la lista coins.
  // ignore: missing_return
  Future<List<Coin>> getCoins() async {
    try {
      //TODO connect to DB
      //Esto esta asi hasta que haya una DB propia a donde consultar. Ahora es redundante.
      final coinsList = await coinAPIRepo.getCoins();
      coins = coinsList;
      return coins;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> setCoins() async {
    throw UnimplementedError();
  }
}
