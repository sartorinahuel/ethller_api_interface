part of ethller_api_interface;

class MinerPayout {
  int start;
  int end;
  double amount;
  String txHash;
  DateTime paidOn;

  MinerPayout({
    this.start,
    this.end,
    this.amount,
    this.txHash,
    this.paidOn,
  });

  MinerPayout.fromJson(Map<String, dynamic> json) {
    start = json['start'] ?? 0;
    end = json['end'] ?? 0;
    amount = json['amount'] == null ? 0.0 : json['amount'] / 1000000000000000000;
    txHash = json['amount'] == null ? 0.0 : json['txHash'];
    paidOn = json['amount'] == null
        ? DateTime.fromMillisecondsSinceEpoch(1)
        : DateTime.fromMillisecondsSinceEpoch(json['paidOn'] * 1000);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['start'] = start;
    data['end'] = end;
    data['amount'] = amount;
    data['txHash'] = txHash;
    data['paidOn'] = paidOn;
    return data;
  }
}
