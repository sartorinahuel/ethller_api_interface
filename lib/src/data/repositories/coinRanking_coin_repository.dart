part of ethller_api_interface;

class CoinRankingRepository extends CoinsRepository {
  static const String coinRankingEndpoint = 'https://api.coinranking.com/v2';
  static const Map<String, String> coinRankingHttpHeaders = {
    'x-access-token':
        'coinranking0225f97ed64816cf9d51c467b93ee73482f41c30efb5eb76',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST,GET,DELETE,PUT,OPTIONS',
    'Accept': '*/*'
  };
  var coinRankinClient = http.Client();

  @override
  Future<Coin> getCoinById(String id) async {
    final url = coinRankingEndpoint + '/coin/$id';

    final response =
        await coinRankinClient.get(url, headers: coinRankingHttpHeaders);

    final rawData = json.decode(response.body);

    final coin = Coin.fromJson(rawData['data']['coin']);

    return coin;
  }

  @override
  Future<CoinHistory> getCoinPriceById(String id) async {
    final url = coinRankingEndpoint + '/coin/$id/historic-price';

    final response =
        await coinRankinClient.get(url, headers: coinRankingHttpHeaders);

    final rawData = json.decode(response.body);

    final utcTime = DateTime.now().toUtc().truncateInMinutes();

    return CoinHistory(
      date: utcTime,
      price: num.parse(rawData['data']['price']),
      coinId: id,
    );
  }

  @override
  Future<CoinHistory> getCoinPriceByIdAndTimeStamp(
      String id, int timeStamp) async {
    final url =
        coinRankingEndpoint + '/coin/$id/historic-price?timestamp=$timeStamp';

    var coinRankinClient = http.Client();

    final response =
        await coinRankinClient.get(url, headers: coinRankingHttpHeaders);

    final rawData = json.decode(response.body);

    final utcTime = DateTime.now().toUtc().truncateInMinutes();

    //TODO error handling

    return CoinHistory(
      date: utcTime,
      price: num.parse(rawData['data']['price']),
      coinId: id,
    );
  }

  @override
  Future<List<Coin>> getCoins() async {
    final url = coinRankingEndpoint + '/coins';
    final response =
        await coinRankinClient.get(url, headers: coinRankingHttpHeaders);

    final rawData = json.decode(response.body);

    // ignore: omit_local_variable_types
    List<Coin> newCoins = [];

    for (var item in rawData['data']['coins']) {
      final newCoin = Coin.fromJson(item);
      newCoins.add(newCoin);
    }
    return newCoins;
  }

  @override
  Future<void> setCoins() {
    // TODO: implement setCoins
    throw UnimplementedError();
  }

  @override
  Future<void> updateCoinsDatabase() async {
    final i = 0;
    do {
      if (DateTime.now().toUtc().hour == 0) {
        final newCoins = await getCoins();
        for (var coin in newCoins) {
          await dbService.setDocument('coins', coin.uuid, coin.toJson());
        }
        print('\n');
        print('Last coins sync: ${DateTime.now()}.');
        await Future.delayed(Duration(hours: 23, minutes: 55));
      }
      await Future.delayed(Duration(minutes: 5));
    } while (i == 0);
  }
}
