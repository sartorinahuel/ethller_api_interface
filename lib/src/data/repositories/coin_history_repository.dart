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
        nowTruncatedInMinutes.subtractYears(1).millisecondsSinceEpoch;
    final twoYearsPreviousRecord =
        nowTruncatedInMinutes.subtractYears(2).millisecondsSinceEpoch;

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
      if ((DateTime.now().toUtc().minute % 4) == 0) {
        await _updateCoinsHostories(coinHistoriesList);
        await deleteUnusedRecords();
        print('\n');
        print('Last sync: ${DateTime.now()}.');
        await Future.delayed(Duration(minutes: 3));
      }
      await Future.delayed(Duration(seconds: 20));
    } while (i == 0);
  }

  final StreamController<List<CoinHistory>>
      _oneDayRangeCoinHistoriesListStreamController =
      StreamController<List<CoinHistory>>.broadcast();

  final StreamController<List<CoinHistory>>
      _oneWeekRangeCoinHistoriesListStreamController =
      StreamController<List<CoinHistory>>.broadcast();

  final StreamController<List<CoinHistory>>
      _oneMonthRangeCoinHistoriesListStreamController =
      StreamController<List<CoinHistory>>.broadcast();

  final StreamController<List<CoinHistory>>
      _oneYearRangeCoinHistoriesListStreamController =
      StreamController<List<CoinHistory>>.broadcast();

  final StreamController<List<CoinHistory>>
      _twoYearsRangeCoinHistoriesListStreamController =
      StreamController<List<CoinHistory>>.broadcast();

  @override
  Stream<List<CoinHistory>> get oneDayRangeCoinHistoriesListStream =>
      _oneDayRangeCoinHistoriesListStreamController.stream;
  @override
  Stream<List<CoinHistory>> get oneWeekRangeCoinHistoriesListStream =>
      _oneDayRangeCoinHistoriesListStreamController.stream;
  @override
  Stream<List<CoinHistory>> get oneMonthRangeCoinHistoriesListStream =>
      _oneDayRangeCoinHistoriesListStreamController.stream;
  @override
  Stream<List<CoinHistory>> get oneYearRangeCoinHistoriesListStream =>
      _oneDayRangeCoinHistoriesListStreamController.stream;
  @override
  Stream<List<CoinHistory>> get twoYearsRangeCoinHistoriesListStream =>
      _oneDayRangeCoinHistoriesListStreamController.stream;

  @override
  Future<void> getCoinHistoriesList() async {
    final i = 0;

    // _coinHistoriesListStreamController.add(coinHistoriesList);

    do {
      coinHistoriesList.clear();
      final response = await dbService.getCollection('coinHistories');

      for (var rawCoin in response.values) {
        final ch = CoinHistory(
          coinId: rawCoin['coinId'],
          date: DateTime.parse(rawCoin['date']),
          price: rawCoin['price'],
        );
        coinHistoriesList.add(ch);
      }

      await filterCoinHistoriesIntoRanges(coinHistoriesList);
      // _coinHistoriesListStreamController.add(coinHistoriesList);

      await Future.delayed(Duration(minutes: 1));
    } while (i == 0);
  }

  Future<void> filterCoinHistoriesIntoRanges(List<CoinHistory> coinHistories) async {

    // ignore: omit_local_variable_types
    List<CoinHistory> oneDayRange = [];
    // ignore: omit_local_variable_types
    List<CoinHistory> oneweekRange = [];
    // ignore: omit_local_variable_types
    List<CoinHistory> oneMonthRange = [];
    // ignore: omit_local_variable_types
    List<CoinHistory> oneYearRange = [];
    // ignore: omit_local_variable_types
    List<CoinHistory> twoYearsRange = [];

    //Order by newest first
    coinHistories.sort((a, b) => b.date.compareTo(a.date));

    //Last record date
    final last = coinHistories[0].date;
    //clear range list for refill
    oneDayRange.clear();
    //Refill if they are younger than 24hs
    coinHistories.forEach((element) {
      if (element.date.isAfter(last.subtractDays(1))) {
        oneDayRange.add(element);
      }
    });
    print('${oneDayRange.length} elements were added to One day Range');
    _oneDayRangeCoinHistoriesListStreamController.add(oneDayRange);

    //clear range list for refill
    oneweekRange.clear();
    //Counter for reorder
    var i = 56 * 60 * 1000;
    //Refill if they are younger than 7 days and match rules
    coinHistories.forEach((element) {
      if (element.date.isAfter(last.subtractDays(7))) {
        if (element.date.millisecondsSinceEpoch == (last.millisecondsSinceEpoch - i)) {
          oneweekRange.add(element);
        }
      }
      i += 56 * 60 * 1000;
    });
    print('${oneweekRange.length} elements were added to One Week Range');
    _oneWeekRangeCoinHistoriesListStreamController.add(oneweekRange);

    //clear range list for refill
    oneMonthRange.clear();
    //Clear counter
    i = 4;
    //Refill if they are younger than one month and match rules
    coinHistories.forEach((element) {
      if (element.date.isAfter(last.subtractMonths(1))) {
        if (element.date == last.subtractHours(i)) {
          oneMonthRange.add(element);
        }
      }
      i += 4;
    });
    print('${oneMonthRange.length} elements were added to One Month Range');
    _oneMonthRangeCoinHistoriesListStreamController.add(oneMonthRange);

    //clear range list for refill
    oneYearRange.clear();
    //Clear counter
    i = 2;
    //Refill if they are younger than one month and match rules
    coinHistories.forEach((element) {
      if (element.date.isAfter(last.subtractYears(1))) {
        if (element.date == last.subtractDays(i)) {
          oneYearRange.add(element);
        }
      }
      i += 2;
    });
    print('${oneYearRange.length} elements were added to One year Range');
    _oneYearRangeCoinHistoriesListStreamController.add(oneYearRange);

    //clear range list for refill
    twoYearsRange.clear();
    //Clear counter
    i = 4;
    //Refill if they are younger than one month and match rules
    coinHistories.forEach((element) {
      if (element.date.isAfter(last.subtractYears(2))) {
        if (element.date == last.subtractDays(i)) {
          twoYearsRange.add(element);
        }
      }
      i += 4;
    });
    print('${twoYearsRange.length} elements were added to two years range');
    _twoYearsRangeCoinHistoriesListStreamController.add(twoYearsRange);
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
