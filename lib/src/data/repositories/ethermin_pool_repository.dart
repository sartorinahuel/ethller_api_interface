part of ethller_api_interface;

class EtherminePoolRepository extends PoolRepository{
  static const String ethermineEndpoint = 'https://api.ethermine.org';
  static const Map<String, String> ethermineHttpHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST,GET,DELETE,PUT,OPTIONS',
    'Accept': '*/*'
  };
  var ethermineClient = http.Client();

  // ignore: prefer_final_fields
  StreamController<PoolData> _poolDataStreamController =
     StreamController<PoolData>.broadcast();

  @override
  Stream<PoolData> get poolDataStream => _poolDataStreamController.stream;

  @override
  Future<PoolData> getPoolStats() async {
    print('Getting pool data...');
    final url = ethermineEndpoint;

    final response =
        await ethermineClient.get(url, headers: ethermineHttpHeaders);

    final rawData = json.decode(response.body);
    print('Pool data: $rawData');

    final poolData = PoolData.fromJson(rawData);

    _poolDataStreamController.add(poolData);
    return poolData;
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