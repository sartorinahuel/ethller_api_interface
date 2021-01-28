part of ethller_api_interface;

//Global variables
const String endpoint = 'endpoint';

//Dependencies
final CoinsRepository coinRepo = AppCoinRepository();
final CoinsRepository coinAPIRepo = CoinRankingCoinRepository();
final CoinHistoriesRepository coinHistoryRepo = AppCoinHistoriesRepository();
final CoinHistoriesRepository coinAPIHistoryRepo = CoinRankingCoinHistoriesRepositry();
final DBService dbService = FirebaseRealtimeDBService();
final PoolRepository poolRepo = EtherminePoolRepository();
