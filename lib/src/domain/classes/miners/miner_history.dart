part of ethller_api_interface;

class MinerHistory {
  int time;
  num reportedHashrate;
  num currentHashrate;
  int validShares;
  int invalidShares;
  int staleShares;
  num averageHashrate;
  int activeWorkers;

  MinerHistory({
    this.time,
    this.reportedHashrate,
    this.currentHashrate,
    this.validShares,
    this.invalidShares,
    this.staleShares,
    this.averageHashrate,
    this.activeWorkers,
  });

  MinerHistory.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    reportedHashrate = json['reportedHashrate'] / 1000000;
    currentHashrate = json['currentHashrate'] / 1000000;
    validShares = json['validShares'];
    invalidShares = json['invalidShares'];
    staleShares = json['staleShares'];
    averageHashrate = json['averageHashrate'] / 1000000;
    activeWorkers = json['activeWorkers'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['time'] = time;
    data['reportedHashrate'] = reportedHashrate;
    data['currentHashrate'] = currentHashrate;
    data['validShares'] = validShares;
    data['invalidShares'] = invalidShares;
    data['staleShares'] = staleShares;
    data['averageHashrate'] = averageHashrate;
    data['activeWorkers'] = activeWorkers;
    return data;
  }
}
