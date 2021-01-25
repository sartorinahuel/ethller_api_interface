part of ethller_api_interface;

class FirebaseRealtimeDBService extends DBService {
  static const String firebaseRealtimeDBEndpoint =
      'https://ethller-a3d77-default-rtdb.firebaseio.com/';

  static const Map<String, String> firebaseRealtimeDBHttpHeaders = {};

  var firebaseRealtimeDBClient = http.Client();

  @override
  Future getDocument(String route, String id) async {
    try {
      final url = firebaseRealtimeDBEndpoint + route + '$id.json';

      final response = await firebaseRealtimeDBClient.get(
        url,
        headers: firebaseRealtimeDBHttpHeaders,
      );

      final rawData = json.decode(response.body);

      return rawData;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future getCollection(String route) async {
    final url = firebaseRealtimeDBEndpoint + route + '.json';
      // print(url);
      final response = await firebaseRealtimeDBClient.get(
        url,
        headers: firebaseRealtimeDBHttpHeaders,
      );
      // print(response.body);

      final rawData = json.decode(response.body);

      // print(rawData);
      return rawData;
  }

  @override
  Future<void> setCollection(String route) {
    // TODO: implement setCollection
    throw UnimplementedError();
  }

  @override
  Future<void> setDocument(String route, String id, Map data) async {
    try {
      final url = firebaseRealtimeDBEndpoint + route + '/$id.json';

      final rawData = json.encode(data);

      await firebaseRealtimeDBClient.put(url,
          headers: firebaseRealtimeDBHttpHeaders, body: rawData);
    } catch (e) {
      print(e);
    }
  }

  @override
  Stream<QuerySnapshot> streamCollection(String route) {
    // TODO: implement streamCollection
    throw UnimplementedError();
  }

  @override
  Stream streamDocument(String route, String id) {
    // TODO: implement streamDocument
    throw UnimplementedError();
  }

  @override
  Future<void> deleteDocument(String route, String id) async {
    try {
      final url = firebaseRealtimeDBEndpoint + route + '$id.json';

      await firebaseRealtimeDBClient.delete(url,
          headers: firebaseRealtimeDBHttpHeaders);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
