part of ethller_api_interface;

//Global variables
const String endpoint =  'endpoint';

//Dependencies
final CoinsRepository coinRepo = CoinRankingRepository();
final CoinHistoryRepository coinHistoryRepo = AppCoinHistoryRepository();
final DBService dbService = FirebaseRealtimeDBService();
final PoolRepository poolRepo = EtherminePoolRepository();