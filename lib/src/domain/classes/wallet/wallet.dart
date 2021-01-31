part of ethller_api_interface;

class Wallet {
  String id;
  double balance;
  double inUSD;
  double inBTC;
  List<WalletTransaction> transactions;

  Wallet({
    this.id,
    this.balance,
    this.inBTC,
    this.inUSD,
    this.transactions,
  });
}
