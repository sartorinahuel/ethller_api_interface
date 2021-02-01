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
    time = DateTime.fromMillisecondsSinceEpoch(json['time'] * 1000);
    lastSeen = DateTime.fromMillisecondsSinceEpoch(json['lastSeen'] * 1000);
    reportedHashrate = json['reportedHashrate'] / 1000000;
    currentHashrate = json['currentHashrate'] / 1000000;
    validShares = json['validShares'];
    invalidShares = json['invalidShares'];
    staleShares = json['staleShares'];
    averageHashrate = json['averageHashrate'] / 1000000;
    activeWorkers = json['activeWorkers'];
    unpaid = (json['unpaid'] as String).toDoubleFromBigInt();
    coinsPerMin = json['coinsPerMin'];
    usdPerMin = json['usdPerMin'];
    btcPerMin = json['btcPerMin'];
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
