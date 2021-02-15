part of ethller_api_interface;

class WorkerHistoryResponse {
  String status;
  WorkerHistory data;

  WorkerHistoryResponse({
    this.status,
    this.data,
  });

  WorkerHistoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] == null ? null : WorkerHistory.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) data['data'] = this.data.toJson();
    return data;
  }
}

class WorkerHistory {
  DateTime time;
  double reportedHashrate;
  double currentHashrate;
  int validShares;
  int invalidShares;
  int staleShares;
  double averageHashrate;

  WorkerHistory({
    this.time,
    this.reportedHashrate,
    this.currentHashrate,
    this.validShares,
    this.invalidShares,
    this.staleShares,
    this.averageHashrate,
  });

  WorkerHistory.fromJson(Map<String, dynamic> json) {
    time = DateTime.fromMillisecondsSinceEpoch(json['time'] * 1000);
    reportedHashrate = json['reportedHashrate'] == null ? 0.0 : json['reportedHashrate'].toDouble();
    currentHashrate = json['currentHashrate'] == null ? 0.0 : json['currentHashrate'].toDouble();
    validShares = json['validShares'] ?? 0;
    invalidShares = json['invalidShares'] ?? 0;
    staleShares = json['staleShares'] ?? 0;
    averageHashrate = json['averageHashrate'] == null ? 0.0 : json['averageHashrate'].toDouble();
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
    return data;
  }
}
