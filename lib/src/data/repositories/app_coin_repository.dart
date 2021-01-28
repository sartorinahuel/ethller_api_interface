part of ethller_api_interface;

class AppCoinRepository extends CoinsRepository {
  @override
  Future<Coin> getCoinById(String id) async {
    return await coinAPIRepo.getCoinById(id);
  }

  @override
  Future<History> getCoinPriceById(String id) async {
    return await coinAPIRepo.getCoinPriceById(id);
  }

  @override
  Future<History> getCoinPriceByIdAndTimeStamp(String id, int timeStamp) async {
    return await coinAPIRepo.getCoinPriceByIdAndTimeStamp(id, timeStamp);
  }

  @override
  Future<List<Coin>> getCoins() async {
    final i = 0;
    do {
      try {
        //TODO connect to DB
        //Esto esta asi hasta que haya una DB propia a donde consultar. Ahora es redundante.
        final coinsList = await coinAPIRepo.getCoins();
        coins = coinsList;
        await Future.delayed(Duration(hours: 4));
        // return coins;
      } catch (e) {
        rethrow;
      }
    } while (i == 0);
  }

  @override
  Future<void> setCoins() async {
    // TODO: implement setCoins
    throw UnimplementedError();
  }
}
