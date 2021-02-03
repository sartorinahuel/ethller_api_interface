part of ethller_api_interface;

class Workers {
  String worker;
  int time;
  int lastSeen;
  int reportedHashrate;
  double currentHashrate;
  int validShares;
  int invalidShares;
  int staleShares;
  double averageHashrate;
  List<WorkerHistory> history;

  Workers({
    this.worker,
    this.time,
    this.lastSeen,
    this.reportedHashrate,
    this.currentHashrate,
    this.validShares,
    this.invalidShares,
    this.staleShares,
    this.averageHashrate,
    this.history,
  });

  Workers.fromJson(Map<String, dynamic> json) {
    worker = json['worker'];
    time = json['time'];
    lastSeen = json['lastSeen'];
    reportedHashrate = json['reportedHashrate'];
    currentHashrate = json['currentHashrate'];
    validShares = json['validShares'];
    invalidShares = json['invalidShares'];
    staleShares = json['staleShares'];
    averageHashrate = json['averageHashrate'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['worker'] = worker;
    data['time'] = time;
    data['lastSeen'] = lastSeen;
    data['reportedHashrate'] = reportedHashrate;
    data['currentHashrate'] = currentHashrate;
    data['validShares'] = validShares;
    data['invalidShares'] = invalidShares;
    data['staleShares'] = staleShares;
    data['averageHashrate'] = averageHashrate;
    return data;
  }
}
