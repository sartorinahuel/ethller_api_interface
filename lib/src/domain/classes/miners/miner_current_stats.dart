part of ethller_api_interface;

class CurrentStats {
  int time;
  int lastSeen;
  int reportedHashrate;
  num currentHashrate;
  int validShares;
  int invalidShares;
  int staleShares;
  num averageHashrate;
  int activeWorkers;
  int unpaid;
  num coinsPerMin;
  num usdPerMin;
  num btcPerMin;

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
    time = json['time'];
    lastSeen = json['lastSeen'];
    reportedHashrate = json['reportedHashrate'];
    currentHashrate = json['currentHashrate'];
    validShares = json['validShares'];
    invalidShares = json['invalidShares'];
    staleShares = json['staleShares'];
    averageHashrate = json['averageHashrate'];
    activeWorkers = json['activeWorkers'];
    unpaid = json['unpaid'];
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
