part of ethller_api_interface;

class AppCoinHistoriesRepository extends CoinHistoriesRepository {
  @override
  Future<List<History>> getCoinHistoriesList(String coinId, CoinHistoriesPeriod period) async {
    //Esto esta asi hasta que haya una DB propia a donde consultar. Ahora es redundante.
    //TODO connect to DB
    return await coinHistoryAPIRepo.getCoinHistoriesList(coinId, period);
  }
}
