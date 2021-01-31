import 'package:ethller_api_interface/ethller_api_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final coinId = 'razxDUgYGNAdQ';
  final period = CoinHistoriesPeriod.ONEDAY;

  group('Classes', () {
    test('Json to Wallet', () async {
      final coinHistory = await coinHistoryAPIRepo.getCoinHistoriesList(coinId, period);
      expect(coinHistory, isInstanceOf<List<History>>());
    });
  });
}
