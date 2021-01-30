/// Support for doing something awesome.
///
/// More dartdocs go here.
library ethller_api_interface;

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

export 'package:http/http.dart';

part 'src/domain/globals.dart';
part 'src/data/services/firebase_realtime_database_service.dart';
part 'src/data/repositories/coin_ranking_coin_repository.dart';
part 'src/data/repositories/ethermine_miner_repository.dart';
part 'src/data/repositories/etherscan_wallet_repository.dart';
part 'src/data/repositories/coin_ranking_coin_histories_repository.dart';
part 'src/data/repositories/app_coin_history_repository.dart';
part 'src/data/repositories/app_coin_repository.dart';
part 'src/data/repositories/ethermine_pool_repository.dart';
part 'src/domain/classes/wallet/wallet.dart';
part 'src/domain/classes/wallet/wallet_transaction.dart';
part 'src/domain/classes/coins/coins.dart';
part 'src/domain/classes/coins/coins_data.dart';
part 'src/domain/classes/coins/data.dart';
part 'src/domain/classes/coins/stats.dart';
part 'src/domain/classes/coin_history/coin_histories.dart';
part 'src/domain/classes/pool/data.dart';
part 'src/domain/classes/pool/pool_stats.dart';
part 'src/domain/classes/pool/pools.dart';
part 'src/domain/classes/pool/mined_blocks.dart';
part 'src/domain/classes/miners/miner.dart';
part 'src/domain/classes/miners/miner_current_stats.dart';
part 'src/domain/classes/miners/miner_history.dart';
part 'src/domain/classes/miners/miner_payout.dart';
part 'src/domain/classes/app_error.dart';
part 'src/domain/repositories/pool_repository.dart';
part 'src/domain/repositories/miners_repository.dart';
part 'src/domain/repositories/coins_repository.dart';
part 'src/domain/repositories/coin_history_repository.dart';
part 'src/domain/repositories/wallet_repository.dart';
part 'src/domain/services/database_service.dart';
part 'src/extensions/datetime_extensions.dart';
