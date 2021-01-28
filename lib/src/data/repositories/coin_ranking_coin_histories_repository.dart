part of ethller_api_interface;

class CoinRankingCoinHistoriesRepositry extends CoinHistoriesRepository {
  @override
  // TODO: implement coinHistoriesListStream
  Stream<List<CoinHistories>> get coinHistoriesListStream =>
      throw UnimplementedError();

  @override
  Future<void> deleteUnusedRecords() {
    // TODO: implement deleteUnusedRecords
    throw UnimplementedError();
  }

  @override
  Future<void> getCoinHistoriesList() {
    // TODO: implement getCoinHistoriesList
    throw UnimplementedError();
  }
}
