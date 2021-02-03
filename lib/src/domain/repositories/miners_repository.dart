part of ethller_api_interface;

abstract class MinersRepository {
  Miner miner = Miner();

  Future<Miner> getMinerData(String minerId);

  Future<CurrentStats> updateMinerCurrentStats(String minerId);
  Future<double> updateMinerMinPayout(String minerId);
  Future<List<MinerHistory>> updateMinerHistory(String minerId);
  Future<List<MinerPayout>> updateMinerPayouts(String minerId);
  Future<List<Workers>> getWorkers(String minerId);
  Future<List<WorkerHistory>> getWorkerHistory(String minerId, String workerId);
}
