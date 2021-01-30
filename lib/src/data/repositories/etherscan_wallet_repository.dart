part of ethller_api_interface;

class EtherscanWalletRepository extends WalletRepository {
  //=====================HTTP package data======================================
  static const String etherscanEndpoint = 'https://api.etherscan.io/api';
  static const String etherscanAPIKey = '314QFYT1GQU3AIGWEWIZJKTEZ1E5Q2SF4B';
  static const Map<String, String> etherscanHttpHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST,GET,DELETE,PUT,OPTIONS',
    'Accept': '*/*'
  };
  //Http client
  static final etherscanClient = http.Client();
  //=====================HTTP package data======================================

  //TODO error handling

  @override
  Future<Wallet> getWalletData(String walletId) async {
    final balance = await getWalletBalance();
    final txs = await getWalletTransactions();

    return Wallet(id: walletId, balance: balance, transactions: txs);
  }

  @override
  Future<String> getWalletBalance() async {
    final url = etherscanEndpoint + '?module=account&action=balance&address=$walletId&tag=latest&apikey=$etherscanAPIKey';

    final response = await etherscanClient.get(url, headers: etherscanHttpHeaders);

    final rawData = json.decode(response.body);

    return rawData['result'];
  }

  @override
  Future<List<WalletTransaction>> getWalletTransactions() async {
    // ignore: omit_local_variable_types
    List<WalletTransaction> txs = [];
    final url = etherscanEndpoint +
        '?module=account&action=txlist&address=$walletId&startblock=0&endblock=100&sort=dec&apikey=$etherscanAPIKey';

    final response = await etherscanClient.get(url, headers: etherscanHttpHeaders);

    final rawData = json.decode(response.body);

    for (var data in rawData['result']) {
      final tx = WalletTransaction.fromJson(data);
      txs.add(tx);
    }
    return txs;
  }
}
