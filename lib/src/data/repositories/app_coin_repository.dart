part of ethller_api_interface;

class AppCoinRepository extends CoinsRepository {
  @override
  Future<Coin> getCoinById(String id) async {
    final searchedCoin = coins.firstWhere((element) => element.uuid == id);
    return searchedCoin;
  }

  @override
  Future<History> getCoinPriceById(String id) async {
    //Esto esta asi hasta que haya una DB propia a donde consultar. Ahora es redundante.
    return await coinAPIRepo.getCoinPriceById(id);
  }

  @override
  Future<History> getCoinPriceByIdAndTimeStamp(String id, int timeStamp) async {
    //Esto esta asi hasta que haya una DB propia a donde consultar. Ahora es redundante.
    return await coinAPIRepo.getCoinPriceByIdAndTimeStamp(id, timeStamp);
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
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setCoins() async {
    throw UnimplementedError();
  }
}
