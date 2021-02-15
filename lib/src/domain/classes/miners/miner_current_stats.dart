part of ethller_api_interface;

class CurrentStats {
  DateTime time;
  DateTime lastSeen;
  double reportedHashrate;
  double currentHashrate;
  int validShares;
  int invalidShares;
  int staleShares;
  double averageHashrate;
  int activeWorkers;
  double unpaid;
  double coinsPerMin;
  double usdPerMin;
  double btcPerMin;

  CurrentStats({
    this.time,
    this.lastSeen,
    this.reportedHashrate,
    this.currentHashrate,
    this.validShares,
    this.invalidShares,
    this.staleShares,
    this.averageHashrate,
    this.activeWorkers,
    this.unpaid,
    this.coinsPerMin,
    this.usdPerMin,
    this.btcPerMin,
  });

  CurrentStats.fromJson(Map<String, dynamic> json) {
    time =
        json['time'] == null ? DateTime.fromMillisecondsSinceEpoch(1) : DateTime.fromMillisecondsSinceEpoch(json['time'] * 1000);
    lastSeen = json['lastSeen'] == null ? null : DateTime.fromMillisecondsSinceEpoch(json['lastSeen'] * 1000);
    reportedHashrate = json['reportedHashrate'] == null ? null : json['reportedHashrate'] / 1000000;
    currentHashrate = json['currentHashrate'] == null ? null : json['currentHashrate'] / 1000000;
    validShares = json['validShares'] ?? 0;
    invalidShares = json['invalidShares'] ?? 0;
    staleShares = json['lastSeen'] ?? 0;
    averageHashrate = json['averageHashrate'] == null ? null : json['averageHashrate'] / 1000000;
    activeWorkers = json['activeWorkers'] ?? 0;
    unpaid = json['unpaid'] == null ? null : json['unpaid'] / 1000000000000000000;
    coinsPerMin = json['coinsPerMin'] ?? 0;
    usdPerMin = json['usdPerMin'] ?? 0;
    btcPerMin = json['btcPerMin'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final CurrentStats = <String, dynamic>{};
    CurrentStats['time'] = time;
    CurrentStats['lastSeen'] = lastSeen;
    CurrentStats['reportedHashrate'] = reportedHashrate;
    CurrentStats['currentHashrate'] = currentHashrate;
    CurrentStats['validShares'] = validShares;
    CurrentStats['invalidShares'] = invalidShares;
    CurrentStats['staleShares'] = staleShares;
    CurrentStats['averageHashrate'] = averageHashrate;
    CurrentStats['activeWorkers'] = activeWorkers;
    CurrentStats['unpaid'] = unpaid;
    CurrentStats['coinsPerMin'] = coinsPerMin;
    CurrentStats['usdPerMin'] = usdPerMin;
    CurrentStats['btcPerMin'] = btcPerMin;
    return CurrentStats;
  }
}
