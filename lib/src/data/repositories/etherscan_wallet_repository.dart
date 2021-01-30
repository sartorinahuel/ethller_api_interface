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
    final exchange = await getExchengeRates();

    final inUSD = balance * exchange[1];
    final inBTC = balance * exchange[0];

    return Wallet(id: walletId, balance: balance, transactions: txs, inBTC: inBTC, inUSD: inUSD);
  }

  @override
  Future<num> getWalletBalance() async {
    final url = etherscanEndpoint + '?module=account&action=balance&address=$walletId&tag=latest&apikey=$etherscanAPIKey';

    final response = await etherscanClient.get(url, headers: etherscanHttpHeaders);

    final rawData = json.decode(response.body);

    return num.parse(rawData['result']);
  }

  Future<List<double>> getExchengeRates() async {
    final url = etherscanEndpoint + '?module=stats&action=ethprice&apikey=$etherscanAPIKey';

    final response = await etherscanClient.get(url, headers: etherscanHttpHeaders);

    final rawData = json.decode(response.body);

    final toUSD = double.parse(rawData['result']['ethusd']);
    final toBTC = double.parse(rawData['result']['ethbtc']);

    return [toBTC, toUSD];
  }

  @override
  Future<List<WalletTransaction>> getWalletTransactions() async {
    // ignore: omit_local_variable_types
    List<WalletTransaction> txs = [];
    final url = etherscanEndpoint +
        '?module=account&action=txlist&address=$walletId&startblock=0&endblock=99999999&sort=dec&apikey=$etherscanAPIKey';

    final response = await etherscanClient.get(url, headers: etherscanHttpHeaders);

    final rawData = json.decode(response.body);
    print(rawData);
    for (var data in rawData['result']) {
      final tx = WalletTransaction.fromJson(data);
      txs.add(tx);
    }
    return txs;
  }
}
