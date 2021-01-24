part of ethller_api_interface;

class AppCoinHistoryRepository extends CoinHistoryRepository {
  @override
  Future<void> deleteUnusedRecords() async {
    DateTime nextWeekPeriodsRecorded;
    DateTime nextMonthPeriodsRecorded;
    DateTime nextSixMonthsPeriodsRecorded;
    DateTime nextYearPeriodsRecorded;
    DateTime nextTwoYearssPeriodsRecorded;

    nextWeekPeriodsRecorded ??=
        DateTime.now().toUtc().truncateInMinutes().add(Duration(minutes: 56));
    nextMonthPeriodsRecorded ??=
        DateTime.now().toUtc().truncateInMinutes().add(Duration(hours: 4));
    nextSixMonthsPeriodsRecorded ??=
        DateTime.now().toUtc().truncateInMinutes().add(Duration(hours: 24));
    nextYearPeriodsRecorded ??=
        DateTime.now().toUtc().truncateInMinutes().add(Duration(hours: 48));
    nextTwoYearssPeriodsRecorded ??=
        DateTime.now().toUtc().truncateInMinutes().add(Duration(hours: 96));

    final nowTruncatedInMinutes = DateTime.now().truncateInMinutes().toUtc();

    final oneDayPreviousRecord =
        nowTruncatedInMinutes.subtractDays(1).millisecondsSinceEpoch;
    final oneWeekPreviousRecord =
        nowTruncatedInMinutes.subtractDays(7).millisecondsSinceEpoch;
    final oneMonthPreviousRecord =
        nowTruncatedInMinutes.subtractMonths(1).millisecondsSinceEpoch;
    final sixMonthsPreviousRecord =
        nowTruncatedInMinutes.subtractMonths(6).millisecondsSinceEpoch;
    final onYearPreviousRecord =
        nowTruncatedInMinutes.subtractYeras(1).millisecondsSinceEpoch;
    final twoYearsPreviousRecord =
        nowTruncatedInMinutes.subtractYeras(2).millisecondsSinceEpoch;

    if (nextWeekPeriodsRecorded != nowTruncatedInMinutes) {
      ///delete [oneDayPreviousRecord] from database

      // ignore: unawaited_futures
      dbService.deleteDocument(
          'Qwsogvtv82FCd', oneDayPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'razxDUgYGNAdQ', oneDayPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'ZlZpzOJo43mIo', oneDayPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          '-l8Mn2pVlRs-p', oneDayPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'D7B1x_ks7WhV5', oneDayPreviousRecord.toString());
      print('Records deleted: $oneDayPreviousRecord');
    } else {
      nextWeekPeriodsRecorded.add(Duration(minutes: 56));
    }

    if (nextMonthPeriodsRecorded != nowTruncatedInMinutes) {
      ///delete [oneWeekPreviousRecord] from database

      // ignore: unawaited_futures
      dbService.deleteDocument(
          'Qwsogvtv82FCd', oneWeekPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'razxDUgYGNAdQ', oneWeekPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'ZlZpzOJo43mIo', oneWeekPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          '-l8Mn2pVlRs-p', oneWeekPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'D7B1x_ks7WhV5', oneWeekPreviousRecord.toString());

      print('Records deleted: $oneWeekPreviousRecord');
    } else {
      nextMonthPeriodsRecorded.add(Duration(hours: 4));
    }

    if (nextSixMonthsPeriodsRecorded != nowTruncatedInMinutes) {
      ///delete [oneMonthPreviousRecord] from database

      // ignore: unawaited_futures
      dbService.deleteDocument(
          'Qwsogvtv82FCd', oneMonthPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'razxDUgYGNAdQ', oneMonthPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'ZlZpzOJo43mIo', oneMonthPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          '-l8Mn2pVlRs-p', oneMonthPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'D7B1x_ks7WhV5', oneMonthPreviousRecord.toString());

      print('Records deleted: $oneMonthPreviousRecord');
    } else {
      nextSixMonthsPeriodsRecorded.add(Duration(hours: 24));
    }

    if (nextYearPeriodsRecorded != nowTruncatedInMinutes) {
      ///delete [sixMonthsPreviousRecord] from database

      // ignore: unawaited_futures
      dbService.deleteDocument(
          'Qwsogvtv82FCd', sixMonthsPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'razxDUgYGNAdQ', sixMonthsPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'ZlZpzOJo43mIo', sixMonthsPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          '-l8Mn2pVlRs-p', sixMonthsPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'D7B1x_ks7WhV5', sixMonthsPreviousRecord.toString());

      print('Records deleted: $sixMonthsPreviousRecord');
    } else {
      nextYearPeriodsRecorded.add(Duration(hours: 48));
    }

    if (nextTwoYearssPeriodsRecorded != nowTruncatedInMinutes) {
      ///delete [onYearPreviousRecord] from database

      // ignore: unawaited_futures
      dbService.deleteDocument(
          'Qwsogvtv82FCd', onYearPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'razxDUgYGNAdQ', onYearPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'ZlZpzOJo43mIo', onYearPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          '-l8Mn2pVlRs-p', onYearPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'D7B1x_ks7WhV5', onYearPreviousRecord.toString());

      print('Records deleted: $onYearPreviousRecord');
    } else {
      nextTwoYearssPeriodsRecorded.add(Duration(hours: 96));

      ///delete [twoYearsPreviousRecord] from database

      // ignore: unawaited_futures
      dbService.deleteDocument(
          'Qwsogvtv82FCd', twoYearsPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'razxDUgYGNAdQ', twoYearsPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'ZlZpzOJo43mIo', twoYearsPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          '-l8Mn2pVlRs-p', twoYearsPreviousRecord.toString());
      // ignore: unawaited_futures
      dbService.deleteDocument(
          'D7B1x_ks7WhV5', twoYearsPreviousRecord.toString());

      print('Records deleted: $twoYearsPreviousRecord');
    }
  }

  @override
  Future<void> updateCoinHistories() async {
    final i = 0;
    do {
      if ((DateTime.now().toUtc().minute % 4) == 0 ||
          DateTime.now().toUtc().minute == 0) {
        await _updateCoinsHostories(coinHistoriesList);
        await deleteUnusedRecords();
        print('\n');
        print('Last sync: ${DateTime.now()}.');
        await Future.delayed(Duration(minutes: 1));
      }
    } while (i == 0);
  }

  @override
  Stream<List<CoinHistory>> coinHistoriesListStream() async* {
    dbService.streamCollection('coinHistories').listen((data){
      print(data.data);
    });
    //IMPLEMENT
  }
}

Future<void> _updateCoinsHostories(List<CoinHistory> coinHistoriesList) async {
  print('Updating 24h range with 4min gap...');
  print('\n');

  ///New instance of CoinHistory of BOTCOIN
  final bitcoinHistory = await coinRepo.getCoinPriceById('Qwsogvtv82FCd');

  ///Adds the new instance to the list
  coinHistoriesList.add(bitcoinHistory);

  ///Adds the new instance to database
  await dbService.setDocument(
      'coinHistories',
      'Qwsogvtv82FCd-${bitcoinHistory.date.millisecondsSinceEpoch}',
      bitcoinHistory.toJson());
  print('BITCOIN: \$${bitcoinHistory.price.toStringAsFixed(2)}.- USD');

  ///New instance of CoinHistory of ETHEREUM
  final ethereumHistory = await coinRepo.getCoinPriceById('razxDUgYGNAdQ');

  ///Adds the new instance to the list
  coinHistoriesList.add(ethereumHistory);

  ///Adds the new instance to database
  await dbService.setDocument(
      'coinHistories',
      'razxDUgYGNAdQ-${ethereumHistory.date.millisecondsSinceEpoch}',
      ethereumHistory.toJson());
  print('ETHEREUM: \$${ethereumHistory.price.toStringAsFixed(2)}.- USD');

  ///New instance of CoinHistory of BITCON CASH
  final bitcoinCashHistory = await coinRepo.getCoinPriceById('ZlZpzOJo43mIo');

  ///Adds the new instance to the list
  coinHistoriesList.add(bitcoinCashHistory);

  ///Adds the new instance to database
  await dbService.setDocument(
      'coinHistories',
      'ZlZpzOJo43mIo-${bitcoinCashHistory.date.millisecondsSinceEpoch}',
      bitcoinCashHistory.toJson());
  print('ETHEREUM: \$${bitcoinCashHistory.price.toStringAsFixed(2)}.- USD');

  ///New instance of CoinHistory of MONERO
  final moneroHistory = await coinRepo.getCoinPriceById('-l8Mn2pVlRs-p');

  ///Adds the new instance to the list
  coinHistoriesList.add(moneroHistory);

  ///Adds the new instance to database
  await dbService.setDocument(
      'coinHistories',
      '-l8Mn2pVlRs-p-${moneroHistory.date.millisecondsSinceEpoch}',
      moneroHistory.toJson());
  print('ETHEREUM: \$${moneroHistory.price.toStringAsFixed(2)}.- USD');

  ///New instance of CoinHistory of LITE COIN
  final liteCoinHistory = await coinRepo.getCoinPriceById('D7B1x_ks7WhV5');

  ///Adds the new instance to the list
  coinHistoriesList.add(liteCoinHistory);

  ///Adds the new instance to database
  await dbService.setDocument(
      'coinHistories',
      'D7B1x_ks7WhV5-${liteCoinHistory.date.millisecondsSinceEpoch}',
      liteCoinHistory.toJson());
  print('ETHEREUM: \$${liteCoinHistory.price.toStringAsFixed(2)}.- USD');

  print('\n');
}
