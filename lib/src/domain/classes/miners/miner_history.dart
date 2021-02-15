part of ethller_api_interface;

class MinerHistory {
  DateTime time;
  double reportedHashrate;
  double currentHashrate;
  int validShares;
  int invalidShares;
  int staleShares;
  double averageHashrate;
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
    time =
        json['time'] == null ? DateTime.fromMillisecondsSinceEpoch(1) : DateTime.fromMillisecondsSinceEpoch(json['time'] * 1000);
    reportedHashrate = json['reportedHashrate'] == null ? 0.0 : json['reportedHashrate'] / 1000000;
    currentHashrate = json['currentHashrate'] == null ? 0.0 : json['currentHashrate'] / 1000000;
    validShares = json['validShares'] ?? 0;
    invalidShares = json['invalidShares'] ?? 0;
    staleShares = json['staleShares'] ?? 0;
    averageHashrate = json['averageHashrate'] == null ? 0.0 : json['averageHashrate'] / 1000000;
    activeWorkers = json['activeWorkers'] ?? 0;
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
