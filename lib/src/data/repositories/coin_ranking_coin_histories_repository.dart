part of ethller_api_interface;

class CoinRankingCoinHistoriesRepositry extends CoinHistoriesRepository {
  //=====================HTTP package data======================================
  final endpoint = CoinRankingCoinRepository.coinRankingEndpoint;
  final headers = CoinRankingCoinRepository.coinRankingHttpHeaders;
  //Http client
  var coinRankinClient = http.Client();
  //=====================HTTP package data======================================

  @override
  Future<List<History>> getCoinHistoriesList(String coinId, CoinHistoriesPeriod period) async {
    final url = endpoint + '/coin/$coinId/history?timePeriod=$period';
    final response = await coinRankinClient.get(url, headers: headers);

    final rawData = json.decode(response.body);

    final coin = CoinHistories.fromJson(rawData);

    return await coin.data.history;
  }
}
