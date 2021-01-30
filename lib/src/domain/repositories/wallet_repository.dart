part of ethller_api_interface;

abstract class WalletRepository {
  Future<Wallet> getWalletData(String walletId);

  Future<double> getWalletBalance(String walletId);

  Future<List<WalletTransaction>> getWalletTransactions(String walletId);
}
