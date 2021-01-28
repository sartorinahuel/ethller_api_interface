part of ethller_api_interface;

class AppCoinHistoryRepository extends CoinHistoryRepository {
  final referenceDate = DateTime(2016, 1, 1, 0, 0, 0);
  @override
  Future<void> deleteUnusedRecords() async {
    // ignore: omit_local_variable_types
    List<CoinHistory> oneDayRange = [];
    // ignore: omit_local_variable_types
    List<CoinHistory> oneweekRange = [];
    // ignore: omit_local_variable_types
    List<CoinHistory> oneMonthRange = [];
    // ignore: omit_local_variable_types
    List<CoinHistory> sixMonthsRange = [];
    // ignore: omit_local_variable_types
    List<CoinHistory> oneYearRange = [];

    var minutesFromReferenceDate = DateTime.now()
        .subtractYears(1)
        .truncateInMinutes()
        .toUtc()
        .minutesSinceReferenceDate(referenceDate);

    if ((minutesFromReferenceDate % 2880) != 0) {
      minutesFromReferenceDate = DateTime.now()
          .subtractMonths(6)
          .truncateInMinutes()
          .toUtc()
          .minutesSinceReferenceDate(referenceDate);
      if ((minutesFromReferenceDate % 1440) != 0) {
        minutesFromReferenceDate = DateTime.now()
            .subtractMonths(1)
            .truncateInMinutes()
            .toUtc()
            .minutesSinceReferenceDate(referenceDate);
        if ((minutesFromReferenceDate % 240) != 0) {
          minutesFromReferenceDate = DateTime.now()
              .subtractDays(7)
              .truncateInMinutes()
              .toUtc()
              .minutesSinceReferenceDate(referenceDate);
          if ((minutesFromReferenceDate % 56) != 0) {
            final oneDayPreviousRecord = DateTime.now()
                .subtractDays(7)
                .truncateInMinutes()
                .toUtc()
                .millisecondsSinceEpoch;
            // ignore: unawaited_futures
            dbService.deleteDocument('Qwsogvtv82FCd',
                'Qwsogvtv82FCd-' + oneDayPreviousRecord.toString());
            // ignore: unawaited_futures
            dbService.deleteDocument('razxDUgYGNAdQ',
                'razxDUgYGNAdQ-' + oneDayPreviousRecord.toString());
            // ignore: unawaited_futures
            dbService.deleteDocument('ZlZpzOJo43mIo',
                'ZlZpzOJo43mIo-' + oneDayPreviousRecord.toString());
            // ignore: unawaited_futures
            dbService.deleteDocument('-l8Mn2pVlRs-p',
                '-l8Mn2pVlRs-p-' + oneDayPreviousRecord.toString());
            // ignore: unawaited_futures
            dbService.deleteDocument('D7B1x_ks7WhV5',
                'D7B1x_ks7WhV5-' + oneDayPreviousRecord.toString());
          }
        }
      }
    }
  }

  @override
  Future<void> updateCoinHistories() async {
    final i = 0;
    do {
      if ((DateTime.now().toUtc().minute % 8) == 0) {
        await _updateCoinsHostories(coinHistoriesList);
        await deleteUnusedRecords();
        print('\n');
        print('Last sync: ${DateTime.now()}.');
        await Future.delayed(Duration(minutes: 7));
      }
      await Future.delayed(Duration(seconds: 20));
    } while (i == 0);
  }

  final StreamController<List<CoinHistory>> _coinHistoriesListStreamController =
      StreamController<List<CoinHistory>>.broadcast();

  @override
  Stream<List<CoinHistory>> get coinHistoriesListStreamController =>
      _coinHistoriesListStreamController.stream;

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

  Future<void> filterCoinHistoriesIntoRanges(
      List<CoinHistory> coinHistories) async {
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
    //   //clear range list for refill
    //   oneDayRange.clear();
    //   //Refill if they are younger than 24hs
    //   coinHistories.forEach((element) {
    //     if (element.date.isAfter(last.subtractDays(1))) {
    //       oneDayRange.add(element);
    //     }
    //   });
    //   print('${oneDayRange.length} elements were added to One day Range');
    //   _oneDayRangeCoinHistoriesListStreamController.add(oneDayRange);

    //   //clear range list for refill
    //   oneweekRange.clear();
    //   //Counter for reorder
    //   var currentDate = last.subtract(Duration(minutes: 56));
    //   var i = 0;
    //   //Refill if they are younger than 7 days and match rules
    //   coinHistories.forEach((element) {
    //     i++;
    //     if (element.date.isAfter(last.subtract(Duration(days: 7)))) {
    //       if (element.date == currentDate) {
    //         oneweekRange.add(element);
    //       }
    //     }
    //     if ((i % 5) == 0) {
    //       currentDate = currentDate.subtract(Duration(minutes: 56));
    //     }
    //   });
    //   print('${oneweekRange.length} elements were added to One Week Range');
    //   _oneWeekRangeCoinHistoriesListStreamController.add(oneweekRange);

    //   //clear range list for refill
    //   oneMonthRange.clear();
    //   //Clear counter
    //   currentDate = last.subtract(Duration(hours: 4));
    //   i = 0;
    //   //Refill if they are younger than one month and match rules
    //   coinHistories.forEach((element) {
    //     i++;
    //     if (element.date.isAfter(last.subtractMonths(1))) {
    //       if (element.date == currentDate) {
    //         oneMonthRange.add(element);
    //       }
    //     }
    //     if ((i % 5) == 0) {
    //       currentDate = currentDate.subtract(Duration(hours: 4));
    //     }
    //   });
    //   print('${oneMonthRange.length} elements were added to One Month Range');
    //   _oneMonthRangeCoinHistoriesListStreamController.add(oneMonthRange);

    //   //clear range list for refill
    //   oneYearRange.clear();
    //   //Clear counter
    //   currentDate = last.subtract(Duration(days: 2));
    //   i = 0;
    //   //Refill if they are younger than one month and match rules
    //   coinHistories.forEach((element) {
    //     i++;
    //     if (element.date.isAfter(last.subtractYears(1))) {
    //       if (element.date == currentDate) {
    //         oneYearRange.add(element);
    //       }
    //     }
    //     if ((i % 5) == 0) {
    //       currentDate = currentDate.subtract(Duration(days: 2));
    //     }
    //   });
    //   print('${oneYearRange.length} elements were added to One year Range');
    //   _oneYearRangeCoinHistoriesListStreamController.add(oneYearRange);

    //   //clear range list for refill
    //   twoYearsRange.clear();
    //   //Clear counter
    //   currentDate = last.subtract(Duration(days: 4));
    //   i = 0;
    //   //Refill if they are younger than one month and match rules
    //   coinHistories.forEach((element) {
    //     i++;
    //     if (element.date.isAfter(last.subtractYears(2))) {
    //       if (element.date == currentDate) {
    //         twoYearsRange.add(element);
    //       }
    //     }
    //     if ((i % 5) == 0) {
    //       currentDate = currentDate.subtract(Duration(days: 4));
    //     }
    //   });
    //   print('${twoYearsRange.length} elements were added to two years range');
    //   _twoYearsRangeCoinHistoriesListStreamController.add(twoYearsRange);
    // }
  }

  Future<void> _updateCoinsHostories(
      List<CoinHistory> coinHistoriesList) async {
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
}
