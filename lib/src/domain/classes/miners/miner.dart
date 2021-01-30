part of ethller_api_interface;

class Miner {
  String id;
  int minPayout;
  CurrentStats currentStats;
  List<MinerPayout> payouts;
  List<MinerHistory> history;

  Miner({
    this.id,
    this.currentStats,
    this.minPayout,
    this.history,
    this.payouts,
  });
}
