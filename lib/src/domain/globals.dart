part of ethller_api_interface;

//Global variables
int coinsHistoriesRefreshRate = 2; //in minutes
int coinsDataRefreshRate = 48; //in minutes
int poolDataRefreshRate = 5; //in minutes
int minersDataRefreshRate = 2; //in minutes
String walletId = 'walletId';

//Dependencies
final CoinsRepository coinRepo = AppCoinRepository();
final CoinsRepository coinAPIRepo = CoinRankingCoinRepository();
final CoinHistoriesRepository coinHistoryRepo = AppCoinHistoriesRepository();
final CoinHistoriesRepository coinHistoryAPIRepo = CoinRankingCoinHistoriesRepositry();
final DBService dbService = FirebaseRealtimeDBService();
final PoolRepository poolRepo = EtherminePoolRepository();
final MinersRepository minersRepo = EthermineMinerRepository();
final WalletRepository walletRepo = EtherscanWalletRepository();
