import 'package:ethller_api_interface/ethller_api_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final walletId = '0xF02bB51E0aEbCE3FeDd890555A19582FEBa1Eb3a';

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
    test('Json to Wallet tx', () async {
      final json = {
        'blockNumber': '11374902',
        'timeStamp': '1606936029',
        'hash': '0x4529cf433fe835a005ba605cd8ec483fc65151bd594371750f05d9100f2d23d5',
        'nonce': '55',
        'blockHash': '0x9451261a29270494b7dbebc11e0114323e2539875be5f00c1e1e3b97fbb9dde1',
        'transactionIndex': '19',
        'from': '0xcf18cbfe5cdc89d824828a19e827d2e756d3d1af',
        'to': '0x5d57c62e214879ca9c6979a349d8bf8f39b167d2',
        'value': '1234567890123456789012324567',
        'gas': '21000',
        'gasPrice': '35000000000',
        'isError': '0',
        'txreceipt_status': '1',
        'input': '0x',
        'contractAddress': '',
        'cumulativeGasUsed': '1210487',
        'gasUsed': '21000',
        'confirmations': '392728'
      };
      final wallet = await WalletTransaction.fromJson(json);
      expect(wallet, isInstanceOf<WalletTransaction>());
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
    test('Json to workers', () async {
      final workers = await minersRepo.getWorkers(walletId);
      expect(workers, isInstanceOf<List<Workers>>());
      print(workers.length);
    });
  });
}
