part of ethller_api_interface;

class EthermineMinerRepository extends MinersRepository {
  //=====================HTTP package data======================================
  final endpoint = EtherminePoolRepository.ethermineEndpoint;
  final headers = EtherminePoolRepository.ethermineHttpHeaders;
  final ethermineClient = EtherminePoolRepository.ethermineClient;
  //=====================HTTP package data======================================

  final StreamController<Miner> _minerStreamController = StreamController<Miner>.broadcast();

  @override
  Stream<Miner> get minerStream => _minerStreamController.stream;

  @override
  Future<Miner> getMinerData(String minerId) async {
    final currentStats = await updateMinerCurrentStats(minerId);
    final history = await updateMinerHistory(minerId);
    final payouts = await updateMinerPayouts(minerId);
    final minPayout = await updateMinerMinPayout(minerId);

    //Building Miner object
    final currentMiner = Miner(
      id: minerId,
      currentStats: currentStats,
      history: history,
      payouts: payouts,
      minPayout: minPayout,
    );

    miner = currentMiner;
    return currentMiner;
  }

  @override
  Future<CurrentStats> updateMinerCurrentStats(String minerId) async {
    final url = endpoint + '/miner/$minerId/currentStats';
    final response = await ethermineClient.get(url, headers: headers);
    final rawData = json.decode(response.body);
    final currentStats = CurrentStats.fromJson(rawData['data']);

    miner = Miner(
      id: minerId,
      currentStats: currentStats,
      history: miner.history,
      minPayout: miner.minPayout,
      payouts: miner.payouts,
    );

    _minerStreamController.add(miner);
    return currentStats;
  }

  @override
  Future<List<MinerHistory>> updateMinerHistory(String minerId) async {
    // ignore: omit_local_variable_types
    List<MinerHistory> history = [];
    final url = endpoint + '/miner/$minerId/history';
    final response2 = await ethermineClient.get(url, headers: headers);
    final rawData2 = json.decode(response2.body);
    for (var item in rawData2['data']) {
      final h = MinerHistory.fromJson(item);
      history.add(h);
    }

    miner = Miner(
      id: minerId,
      currentStats: miner.currentStats,
      history: history,
      minPayout: miner.minPayout,
      payouts: miner.payouts,
    );

    _minerStreamController.add(miner);
    return history;
  }

  @override
  Future<int> updateMinerMinPayout(String minerId) async {
    final url = endpoint + '/miner/$minerId/settings';
    final response4 = await ethermineClient.get(url, headers: headers);
    final rawData4 = json.decode(response4.body);
    final minPayout = rawData4['data']['minPayout'] as int;

    miner = Miner(
      id: minerId,
      currentStats: miner.currentStats,
      history: miner.history,
      minPayout: minPayout,
      payouts: miner.payouts,
    );

    _minerStreamController.add(miner);
    return minPayout;
  }

  @override
  Future<List<MinerPayout>> updateMinerPayouts(String minerId) async {
    // ignore: omit_local_variable_types
    List<MinerPayout> payouts = [];
    final url = endpoint + '/miner/$minerId/payouts';
    final response3 = await ethermineClient.get(url, headers: headers);
    final rawData3 = json.decode(response3.body);
    for (var item in rawData3['data']) {
      final h = MinerPayout.fromJson(item);
      payouts.add(h);
    }

    miner = Miner(
      id: minerId,
      currentStats: miner.currentStats,
      history: miner.history,
      minPayout: miner.minPayout,
      payouts: payouts,
    );

    _minerStreamController.add(miner);
    return payouts;
  }
}
