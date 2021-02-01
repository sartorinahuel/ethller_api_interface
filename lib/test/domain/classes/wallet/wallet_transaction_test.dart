import 'package:ethller_api_interface/ethller_api_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final walletId = '0xcf18cbfe5cdc89d824828a19e827d2e756d3d1af';

  group('Classes', () {
    test('Json to Wallet', () async {
      final wallet = await walletRepo.getWalletData(walletId);
      expect(wallet, isInstanceOf<Wallet>());
      expect(wallet.id, walletId);
      expect(wallet.inBTC, isInstanceOf<double>());
      print(wallet.inBTC);
      expect(wallet.inUSD, isInstanceOf<double>());
      print(wallet.inUSD);
    });
    test('Json to Miner', () async {
      final miner = await minersRepo.getMinerData(walletId);
      expect(miner, isInstanceOf<Miner>());
      print(miner.id);
      print(miner.currentStats.lastSeen);
      print(miner.currentStats.time);
      print(miner.currentStats.reportedHashrate);
      print(miner.currentStats.currentHashrate);
      print(miner.currentStats.averageHashrate);
      print(miner.currentStats.coinsPerMin);
      print(miner.currentStats.btcPerMin);
      print(miner.history.first.averageHashrate);
      print(miner.history.first.currentHashrate);
      print(miner.history.first.reportedHashrate);
      print(miner.history.first.time);
      print(miner.minPayout);
      print(miner.payouts.first.amount);
      print(miner.payouts.first.paidOn);
    });
    test('Json to Pool', () async {
      final pool = await poolRepo.getPoolStats();
      expect(pool, isInstanceOf<PoolData>());
      print(pool.poolStats.miners);
      print(pool.poolStats.workers);
      print(pool.poolStats.blocksPerHour);
      print(pool.poolStats.hashRate);
      print(pool.minedBlocks.first.miner);
      print(pool.minedBlocks.first.number);
      print(pool.minedBlocks.first.time);
    });
  });
}
