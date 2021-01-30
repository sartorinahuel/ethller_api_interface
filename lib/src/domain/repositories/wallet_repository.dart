part of ethller_api_interface;

abstract class WalletRepository {
  Future<Wallet> getWalletData(String walletId);

  Future<num> getWalletBalance();

  Future<List<WalletTransaction>> getWalletTransactions();
}
