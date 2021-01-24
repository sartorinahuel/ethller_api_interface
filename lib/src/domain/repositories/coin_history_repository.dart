part of ethller_api_interface;

abstract class CoinHistoryRepository {
  List<CoinHistory> coinHistoriesList = [];

  Future<void> updateCoinHistories();

  Future<void> deleteUnusedRecords();


}