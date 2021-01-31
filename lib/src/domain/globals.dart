part of ethller_api_interface;

//Global variables
int coinsHistoriesRefreshRate = 2; //in minutes
int coinsDataRefreshRate = 48; //in minutes
int poolDataRefreshRate = 5; //in minutes
int minersDataRefreshRate = 2; //in minutes
int walletDataRefreshRate = 2; //in minutes
bool updateTrigger = false; //use to trigger and stop data refresh
String walletUID = '';

//ExchangeRates
double ethUsd = 0.0;
double ethBtc = 0.0;

//Dependencies
final CoinsRepository coinRepo = AppCoinRepository();
final CoinsRepository coinAPIRepo = CoinRankingCoinRepository();
final CoinHistoriesRepository coinHistoryRepo = AppCoinHistoriesRepository();
final CoinHistoriesRepository coinHistoryAPIRepo = CoinRankingCoinHistoriesRepositry();
final DBService dbService = FirebaseRealtimeDBService();
final PoolRepository poolRepo = EtherminePoolRepository();
final MinersRepository minersRepo = EthermineMinerRepository();
final WalletRepository walletRepo = EtherscanWalletRepository();
