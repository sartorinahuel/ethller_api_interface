part of ethller_api_interface;

class Miner {
  String id;
  double minPayout;
  CurrentStats currentStats;
  List<MinerPayout> payouts;
  List<MinerHistory> history;
  List<Workers> workers;

  Miner({
    this.id,
    this.currentStats,
    this.minPayout,
    this.history,
    this.workers,
    this.payouts,
  });
}
