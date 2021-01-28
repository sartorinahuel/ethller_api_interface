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
    String periodString;
    switch (period) {
      case CoinHistoriesPeriod.ONEDAY:
        periodString = '24h';
        break;
      case CoinHistoriesPeriod.ONEWEEK:
        periodString = '7d';
        break;
      case CoinHistoriesPeriod.ONEMONTH:
        periodString = '30d';
        break;
      case CoinHistoriesPeriod.ONEYEAR:
        periodString = '1y';
        break;
      case CoinHistoriesPeriod.FIVEYEARS:
        periodString = '5y';
        break;
      default:
        periodString = '24h';
    }
    final url = endpoint + '/coin/$coinId/history?timePeriod=$periodString';
    final response = await coinRankinClient.get(url, headers: headers);

    final rawData = json.decode(response.body);

    final coin = CoinHistories.fromJson(rawData);

    return await coin.data.history;
  }
}
