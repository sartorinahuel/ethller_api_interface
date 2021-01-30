part of ethller_api_interface;

class WalletTransaction {
  String blockNumber;
  String timeStamp;
  String hash;
  String nonce;
  String blockHash;
  String transactionIndex;
  String from;
  String to;
  String value;
  String gas;
  String gasPrice;
  String isError;
  String txreceiptStatus;
  String input;
  String contractAddress;
  String cumulativeGasUsed;
  String gasUsed;
  String confirmations;

  WalletTransaction(
      {this.blockNumber,
      this.timeStamp,
      this.hash,
      this.nonce,
      this.blockHash,
      this.transactionIndex,
      this.from,
      this.to,
      this.value,
      this.gas,
      this.gasPrice,
      this.isError,
      this.txreceiptStatus,
      this.input,
      this.contractAddress,
      this.cumulativeGasUsed,
      this.gasUsed,
      this.confirmations});

  WalletTransaction.fromJson(Map<String, dynamic> json) {
    blockNumber = json['blockNumber'];
    timeStamp = json['timeStamp'];
    hash = json['hash'];
    nonce = json['nonce'];
    blockHash = json['blockHash'];
    transactionIndex = json['transactionIndex'];
    from = json['from'];
    to = json['to'];
    value = json['value'];
    gas = json['gas'];
    gasPrice = json['gasPrice'];
    isError = json[' isError'];
    txreceiptStatus = json[' txreceipt_status'];
    input = json[' input'];
    contractAddress = json[' contractAddress'];
    cumulativeGasUsed = json[' cumulativeGasUsed'];
    gasUsed = json[' gasUsed'];
    confirmations = json[' confirmations'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[' blockNumber'] = blockNumber;
    data[' timeStamp'] = timeStamp;
    data[' hash'] = hash;
    data[' nonce'] = nonce;
    data[' blockHash'] = blockHash;
    data[' transactionIndex'] = transactionIndex;
    data[' from'] = from;
    data[' to'] = to;
    data['value'] = value;
    data['gas'] = gas;
    data['gasPrice'] = gasPrice;
    data['isError'] = isError;
    data['txreceipt_status'] = txreceiptStatus;
    data['input'] = input;
    data['contractAddress'] = contractAddress;
    data['cumulativeGasUsed'] = cumulativeGasUsed;
    data['gasUsed'] = gasUsed;
    data['confirmations'] = confirmations;
    return data;
  }
}
