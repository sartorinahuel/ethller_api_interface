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
    try {
      final balance = await getWalletBalance(walletId);
      final txs = await getWalletTransactions(walletId);
      final exchange = await getExchengeRates();

      final inUSD = balance * exchange[1];
      final inBTC = balance * exchange[0];

      return Wallet(
        id: walletId,
        balance: balance,
        transactions: txs,
        inBTC: inBTC,
        inUSD: inUSD,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<double> getWalletBalance(String walletId) async {
    final url = etherscanEndpoint +
        '?module=account&action=balance&address=$walletId&tag=latest&apikey=$etherscanAPIKey';
    try {
      final response = await etherscanClient.get(url);
      final rawData = json.decode(response.body);

      if (rawData['status'] == '1') {
        final number = int.parse(rawData['result'].truncateString(18));
        return number / 1000000000000000000;
      } else {
        if (rawData['result'] == 'Max rate limit reached') {
          throw AppError.maxRateLimitReached();
        } else {
          throw AppError.genericError(
              message: 'An error occure during fetching ETH´s exchange rates');
        }
      }
    } on AppError catch (_) {
      rethrow;
    } catch (e) {
      throw AppErrorHandling.mapError(e);
    }
  }

  Future<List<double>> getExchengeRates() async {
    final url = etherscanEndpoint +
        '?module=stats&action=ethprice&apikey=$etherscanAPIKey';

    try {
      final response = await etherscanClient.get(url);
      final rawData = json.decode(response.body);

      if (rawData['status'] == '1') {
        final toUSD = double.parse(rawData['result']['ethusd']);
        final toBTC = double.parse(rawData['result']['ethbtc']);

        ethUsd = toUSD;
        ethBtc = toBTC;

        return [toBTC, toUSD];
      } else {
        if (rawData['result'] == 'Max rate limit reached') {
          throw AppError.maxRateLimitReached();
        } else {
          throw AppError.genericError(
              message: 'An error occure during fetching ETH´s exchange rates');
        }
      }
    } on AppError catch (_) {
      rethrow;
    } catch (e) {
      throw AppErrorHandling.mapError(e);
    }
  }

  @override
  Future<List<WalletTransaction>> getWalletTransactions(String walletId) async {
    // ignore: omit_local_variable_types
    List<WalletTransaction> txs = [];

    final url = etherscanEndpoint +
        '?module=account&action=txlist&address=$walletId&startblock=0&endblock=99999999&sort=dec&apikey=$etherscanAPIKey';
    try {
      final response = await etherscanClient.get(url);
      final rawData = json.decode(response.body);

      if (rawData['status'] == '1') {
        for (var data in rawData['result']) {
          final tx = WalletTransaction.fromJson(data);
          txs.add(tx);
        }
        return txs;
      } else {
        if (rawData['result'] == 'Max rate limit reached') {
          throw AppError.maxRateLimitReached();
        } else {
          throw AppError.genericError(
              message: 'An error occure during fetching wallet transactions');
        }
      }
    } on AppError catch (_) {
      rethrow;
    } catch (e) {
      throw AppErrorHandling.mapError(e);
    }
  }
}
