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

  @override
  Future<PoolData> getPoolStats() async {
    final url = ethermineEndpoint + '/poolStats';

    final response = await ethermineClient.get(url, headers: ethermineHttpHeaders);

    final rawData = json.decode(response.body);

    //TODO handle error status
    final poolData = Pools.fromJson(rawData).poolData;

    return poolData;
  }
}
