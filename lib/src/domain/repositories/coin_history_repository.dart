part of ethller_api_interface;

enum CoinHistoriesPeriod { ONEDAY, ONEWEEK, ONEMONTH, ONEYEAR, FIVEYEARS }

abstract class CoinHistoriesRepository {
  List<CoinHistories> coinHistoriesList = [];

  Stream<List<CoinHistories>> get coinHistoriesListStream;

  Future<void> deleteUnusedRecords();

  Future<void> getCoinHistoriesList();
}
