part of ethller_api_interface;

abstract class CoinHistoryRepository {
  List<CoinHistory> coinHistoriesList = [];

  Stream<List<CoinHistory>> get oneDayRangeCoinHistoriesListStream;
  Stream<List<CoinHistory>> get oneWeekRangeCoinHistoriesListStream;
  Stream<List<CoinHistory>> get oneMonthRangeCoinHistoriesListStream;
  Stream<List<CoinHistory>> get oneYearRangeCoinHistoriesListStream;
  Stream<List<CoinHistory>> get twoYearsRangeCoinHistoriesListStream;

  Future<void> updateCoinHistories();

  Future<void> deleteUnusedRecords();

  Future<void> getCoinHistoriesList();
}