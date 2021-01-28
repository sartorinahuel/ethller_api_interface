part of ethller_api_interface;

abstract class CoinsRepository {
  List<Coin> coins = [];

  Future<List<Coin>> getCoins();

  Future<void> setCoins();

  Future<Coin> getCoinById(String id);

  Future<History> getCoinPriceById(String id);

  Future<History> getCoinPriceByIdAndTimeStamp(String id, int timeStamp);
}
