part of ethller_api_interface;

abstract class PoolRepository {
  PoolData poolData = PoolData();

  Stream<PoolData> get poolDataStream;

  Future<PoolData> getPoolStats();

  Future<void> updatePoolStats();
}
