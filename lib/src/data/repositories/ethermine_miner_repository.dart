part of ethller_api_interface;

class EthermineMinerRepository extends MinersRepository {
  //=====================HTTP package data======================================
  final endpoint = EtherminePoolRepository.ethermineEndpoint;
  final headers = EtherminePoolRepository.ethermineHttpHeaders;
  final ethermineClient = EtherminePoolRepository.ethermineClient;
  //=====================HTTP package data======================================

  @override
  Future<Miner> getMinerData(String minerId) async {
    try {
      final currentStats = await updateMinerCurrentStats(minerId);
      final history = await updateMinerHistory(minerId);
      final payouts = await updateMinerPayouts(minerId);
      final minPayout = await updateMinerMinPayout(minerId);
      final workers = await getWorkers(minerId);

      //Building Miner object
      final currentMiner = Miner(
        id: minerId,
        currentStats: currentStats,
        history: history,
        payouts: payouts,
        minPayout: minPayout,
        workers: workers,
      );

      miner = currentMiner;
      return currentMiner;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CurrentStats> updateMinerCurrentStats(String minerId) async {
    final url = endpoint + '/miner/$minerId/currentStats';
    try {
      final response = await ethermineClient.get(url, headers: headers);
      final rawData = json.decode(response.body);

      if (rawData['status'] == 'OK' && rawData['data'] != 'NO DATA') {
        final currentStats = CurrentStats.fromJson(rawData['data']);

        miner = Miner(
          id: minerId,
          currentStats: currentStats,
          history: miner.history,
          minPayout: miner.minPayout,
          payouts: miner.payouts,
          workers: miner.workers,
        );

        return currentStats;
      } else {
        if (rawData['error'] == 'Invalid address' || rawData['data'] == 'NO DATA') {
          throw AppError.walletNotFound();
        } else {
          throw AppError.genericError(message: 'An error occure during fetching miner´s current statistics');
        }
      }
    } on AppError catch (_) {
      rethrow;
    } catch (e) {
      throw AppErrorHandling.mapError(e);
    }
  }

  @override
  Future<List<MinerHistory>> updateMinerHistory(String minerId) async {
    // ignore: omit_local_variable_types
    List<MinerHistory> history = [];
    final url = endpoint + '/miner/$minerId/history';

    try {
      final response = await ethermineClient.get(url, headers: headers);
      final rawData = json.decode(response.body);
      if (rawData['status'] == 'OK' && rawData['data'] != 'NO DATA') {
        for (var item in rawData['data']) {
          final h = MinerHistory.fromJson(item);
          history.add(h);
        }

        miner = Miner(
          id: minerId,
          currentStats: miner.currentStats,
          history: history,
          minPayout: miner.minPayout,
          payouts: miner.payouts,
          workers: miner.workers,
        );
        return history;
      } else {
        if (rawData['error'] == 'Invalid address' || rawData['data'] == 'NO DATA') {
          throw AppError.walletNotFound();
        } else {
          throw AppError.genericError(message: 'An error occure during fetching miner´s history');
        }
      }
    } on AppError catch (_) {
      rethrow;
    } catch (e) {
      throw AppErrorHandling.mapError(e);
    }
  }

  @override
  Future<double> updateMinerMinPayout(String minerId) async {
    final url = endpoint + '/miner/$minerId/settings';

    try {
      final response = await ethermineClient.get(url, headers: headers);
      final rawData = json.decode(response.body);

      if (rawData['status'] == 'OK' && rawData['data'] != 'NO DATA') {
        final minPayout = (rawData['data']['minPayout'] as int) / 1000000000000000000;

        miner = Miner(
          id: minerId,
          currentStats: miner.currentStats,
          history: miner.history,
          minPayout: minPayout,
          payouts: miner.payouts,
          workers: miner.workers,
        );
        return minPayout;
      } else {
        if (rawData['error'] == 'Invalid address' || rawData['data'] == 'NO DATA') {
          throw AppError.walletNotFound();
        } else {
          throw AppError.genericError(message: 'An error occure during fetching miner´s minimum payout setting');
        }
      }
    } on AppError catch (_) {
      rethrow;
    } catch (e) {
      throw AppErrorHandling.mapError(e);
    }
  }

  @override
  Future<List<MinerPayout>> updateMinerPayouts(String minerId) async {
    // ignore: omit_local_variable_types
    List<MinerPayout> payouts = [];
    final url = endpoint + '/miner/$minerId/payouts';
    try {
      final response = await ethermineClient.get(url, headers: headers);
      final rawData = json.decode(response.body);
      if (rawData['status'] == 'OK' && rawData['data'] != 'NO DATA') {
        for (var item in rawData['data']) {
          final h = MinerPayout.fromJson(item);
          payouts.add(h);
        }

        miner = Miner(
          id: minerId,
          currentStats: miner.currentStats,
          history: miner.history,
          minPayout: miner.minPayout,
          payouts: payouts,
          workers: miner.workers,
        );

        return payouts;
      } else {
        if (rawData['error'] == 'Invalid address' || rawData['data'] == 'NO DATA') {
          throw AppError.walletNotFound();
        } else {
          throw AppError.genericError(message: 'An error occure during fetching miner´s payouts');
        }
      }
    } on AppError catch (_) {
      rethrow;
    } catch (e) {
      throw AppErrorHandling.mapError(e);
    }
  }

  @override
  Future<List<Workers>> getWorkers(String minerId) async {
    // ignore: omit_local_variable_types
    List<Workers> workers = [];
    final url = endpoint + '/miner/$minerId/workers';
    try {
      final response = await ethermineClient.get(url, headers: headers);
      final rawData = json.decode(response.body);
      if (rawData['status'] == 'OK' && rawData['data'] != 'NO DATA') {
        if (rawData['data'].length != 0) {
          for (var item in rawData['data']) {
            final h = Workers.fromJson(item);
            final history = await getWorkerHistory(minerId, h.worker);
            h.history = history;
            workers.add(h);
          }
        }
        return workers;
      } else {
        if (rawData['error'] == 'Invalid address' || rawData['data'] == 'NO DATA') {
          throw AppError.walletNotFound();
        } else {
          throw AppError.genericError(message: 'An error occure during fetching workers');
        }
      }
    } on AppError catch (_) {
      rethrow;
    } catch (e) {
      throw AppErrorHandling.mapError(e);
    }
  }

  @override
  Future<List<WorkerHistory>> getWorkerHistory(String minerId, String workerId) async {
    // ignore: omit_local_variable_types
    List<WorkerHistory> histories = [];
    final url = endpoint + '/miner/$minerId/worker/$workerId/history';
    try {
      final response = await ethermineClient.get(url, headers: headers);
      final rawData = json.decode(response.body);
      if (rawData['status'] == 'OK' && rawData['data'] != 'NO DATA') {
        for (var item in rawData['data']) {
          final h = WorkerHistory.fromJson(item);
          histories.add(h);
        }

        return histories;
      } else {
        if (rawData['error'] == 'Invalid address' || rawData['data'] == 'NO DATA') {
          throw AppError.walletNotFound();
        } else {
          throw AppError.genericError(message: 'An error occure during fetching worker´s history');
        }
      }
    } on AppError catch (_) {
      rethrow;
    } catch (e) {
      throw AppErrorHandling.mapError(e);
    }
  }
}
