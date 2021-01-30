part of ethller_api_interface;

class Wallet {
  String id;
  String balance;
  List<WalletTransaction> transactions;

  Wallet({
    this.id,
    this.balance,
    this.transactions,
  });
}
