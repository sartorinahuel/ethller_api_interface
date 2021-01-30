part of ethller_api_interface;

class MinerPayout {
  int start;
  int end;
  int amount;
  String txHash;
  int paidOn;

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
    amount = json['amount'];
    txHash = json['txHash'];
    paidOn = json['paidOn'];
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
