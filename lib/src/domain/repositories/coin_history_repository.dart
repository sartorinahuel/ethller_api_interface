part of ethller_api_interface;

enum CoinHistoriesPeriod { ONEDAY, ONEWEEK, ONEMONTH, ONEYEAR, FIVEYEARS }

abstract class CoinHistoriesRepository {
  Future<List<History>> getCoinHistoriesList(String coinId, CoinHistoriesPeriod period);
}
