part of ethller_api_interface;

abstract class PoolRepository {
  PoolData poolData = PoolData();

  Stream<PoolData> get poolDataStream;

  Future<void> getPoolStats();

  Future<void> updatePoolStats();
}
