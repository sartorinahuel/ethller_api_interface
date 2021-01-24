part of ethller_api_interface;

abstract class CoinsRepository {
  List<Coin> coins = [];
  
  Future<List<Coin>> getCoins();
  
  Future<Coin> getCoinById(String id);
  
  Future<void> setCoins();

  Future<CoinHistory> getCoinPriceById(String id);

  Future<CoinHistory> getCoinPriceByIdAndTimeStamp(String id, int timeStamp);

  Future<void> updateCoinsDatabase();
}
