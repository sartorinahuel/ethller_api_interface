part of ethller_api_interface;

abstract class PoolRepository {
  PoolData poolData = PoolData();

  Future<PoolData> getPoolStats();
}
