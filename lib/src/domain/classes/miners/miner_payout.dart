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
    start = json['start'];
    end = json['end'];
    amount = (json['amount'] as String).toDoubleFromBigInt();
    txHash = json['txHash'];
    paidOn = DateTime.fromMillisecondsSinceEpoch(json['paidOn'] * 1000);
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
