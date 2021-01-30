part of ethller_api_interface;

class Wallet {
  String id;
  num balance;
  num inUSD;
  num inBTC;
  List<WalletTransaction> transactions;

  Wallet({
    this.id,
    this.balance,
    this.inBTC,
    this.inUSD,
    this.transactions,
  });
}
