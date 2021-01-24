/// Support for doing something awesome.
///
/// More dartdocs go here.
library ethller_api_interface;

import 'dart:convert';
import 'package:http/http.dart' as http;

export 'package:http/http.dart';

part 'src/data/repositories/coinRanking_coin_repository.dart';
part 'src/domain/classes/coins/coins.dart';
part 'src/domain/classes/coins/coins_data.dart';
part 'src/domain/classes/coins/data.dart';
part 'src/domain/classes/coins/stats.dart';
part 'src/domain/classes/coin_history/coin_history.dart';
part 'src/domain/classes/coin_history/coin_history_response.dart';
part 'src/domain/classes/app_error.dart';
part 'src/domain/repositories/coins_repository.dart';
part 'src/extensions/datetime_extensions.dart';

// TODO: Export any libraries intended for clients of this package.
