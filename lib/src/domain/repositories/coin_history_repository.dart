part of ethller_api_interface;

abstract class CoinHistoryRepository {
  List<CoinHistory> coinHistoriesList = [];

  Stream<List<CoinHistory>> get coinHistoriesStream;

  Future<void> updateCoinHistories();

  Future<void> deleteUnusedRecords();

  Future<void> getCoinHistoriesList();
}