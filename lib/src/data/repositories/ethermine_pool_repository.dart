part of ethller_api_interface;

class EtherminePoolRepository extends PoolRepository {
  //=====================HTTP package data======================================
  static const String ethermineEndpoint = 'https://api.ethermine.org';
  static const Map<String, String> ethermineHttpHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST,GET,DELETE,PUT,OPTIONS',
    'Accept': '*/*'
  };
  static final ethermineClient = http.Client();
  //=====================HTTP package data======================================

  // ignore: prefer_final_fields
  StreamController<PoolData> _poolDataStreamController = StreamController<PoolData>.broadcast();

  @override
  Stream<PoolData> get poolDataStream => _poolDataStreamController.stream;

  @override
  Future<void> getPoolStats() async {
    print('Getting pool data...');
    final url = ethermineEndpoint + '/poolStats';

    final response = await ethermineClient.get(url, headers: ethermineHttpHeaders);

    final rawData = json.decode(response.body);
    print('Pool data: $rawData');

    //TODO handle error status
    final poolData = Pools.fromJson(rawData).poolData;

    print('Pool total HashRate: ${poolData.poolStats.hashRate.toStringAsFixed(2)}');

    _poolDataStreamController.add(poolData);
  }

  @override
  Future<void> updatePoolStats() async {
    final i = 0;
    do {
      await getPoolStats();
      await Future.delayed(Duration(minutes: 5));
    } while (i == 0);
  }
}
