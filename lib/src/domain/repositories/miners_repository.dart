part of ethller_api_interface;

abstract class MinersRepository {
  Miner miner = Miner();

  Stream<Miner> get minerStream;

  Future<Miner> getMinerData(String minerId);

  Future<CurrentStats> updateMinerCurrentStats(String minerId);
  Future<int> updateMinerMinPayout(String minerId);
  Future<List<MinerHistory>> updateMinerHistory(String minerId);
  Future<List<MinerPayout>> updateMinerPayouts(String minerId);
}
