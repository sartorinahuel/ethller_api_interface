part of ethller_api_interface;

class CoinRankingCoinRepository extends CoinsRepository {
  //=====================HTTP package data======================================
  static const String coinRankingEndpoint = 'https://api.coinranking.com/v2';
  static const Map<String, String> coinRankingHttpHeaders = {
    'x-access-token': 'coinranking0225f97ed64816cf9d51c467b93ee73482f41c30efb5eb76',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST,GET,DELETE,PUT,OPTIONS',
    'Accept': '*/*'
  };
  //Http client
  static final coinRankinClient = http.Client();
  //=====================HTTP package data======================================

  //TODO error handling

  @override
  Future<Coin> getCoinById(String id) async {
    final url = coinRankingEndpoint + '/coin/$id';

    final response = await coinRankinClient.get(url, headers: coinRankingHttpHeaders);

    final rawData = json.decode(response.body);

    final coin = Coin.fromJson(rawData['data']['coin']);

    return coin;
  }

  @override
  Future<History> getCoinPriceById(String id) async {
    final url = coinRankingEndpoint + '/coin/$id/historic-price';

    final response = await coinRankinClient.get(url, headers: coinRankingHttpHeaders);

    final rawData = json.decode(response.body);

    return History.fromJson(rawData['data']);
  }

  @override
  Future<History> getCoinPriceByIdAndTimeStamp(String id, int timeStamp) async {
    final url = coinRankingEndpoint + '/coin/$id/historic-price?timestamp=$timeStamp';

    var coinRankinClient = http.Client();

    final response = await coinRankinClient.get(url, headers: coinRankingHttpHeaders);

    final rawData = json.decode(response.body);

    return History.fromJson(rawData['data']);
  }

  @override
  Future<List<Coin>> getCoins() async {
    final url = coinRankingEndpoint + '/coins';
    final response = await coinRankinClient.get(url, headers: coinRankingHttpHeaders);

    final rawData = json.decode(response.body);

    coins.clear();

    for (var item in rawData['data']['coins']) {
      final newCoin = Coin.fromJson(item);
      coins.add(newCoin);
    }
    return coins;
  }

  @override
  Future<void> setCoins() {
    // TODO: implement setCoins
    throw UnimplementedError();
  }
}
