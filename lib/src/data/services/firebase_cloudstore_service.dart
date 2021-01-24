part of ethller_api_interface;

class FirebaseCloudstoreService extends DBService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future getDocument(String route, String id) async {
    try {
      //try connection setting last access
      await firestore
          .collection(route)
          .doc(id)
          .update({'lastConnection': DateTime.now().toIso8601String()}).timeout(
        Duration(seconds: 5),
        onTimeout: () {
          print('Get User Data Error Timeout');
          throw AppError.connectionTimeout();
        },
      );
      //if no error setting data, return document
      return await firestore.collection(route).doc(id).get();
    } on FirebaseException catch (e) {
      //TODO catch with appError function
      throw AppError(code: e.code, message: e.message);
    } on AppError catch (_) {
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> setDocument(String route, String id, Map data) async {
    try {
      // ignore: omit_local_variable_types
      final DocumentSnapshot requestedDoc =
          await firestore.doc('$route/$id').get();

      //Verifies if the document exists to decide to update or set
      if (requestedDoc.exists) {
        await firestore.doc('$route/$id').update(data).timeout(
          Duration(seconds: 10),
          onTimeout: () {
            print('Set User Data Error Timeout');
            throw AppError.connectionTimeout();
          },
        );
      } else {
        await firestore.collection(route).doc(id).set(data).timeout(
          Duration(seconds: 5),
          onTimeout: () {
            print('Set User Data Error Timeout');
            throw AppError.connectionTimeout();
          },
        );
      }
    } on AppError catch (appError) {
      print(appError.code);
      print(appError.message);
      rethrow;
    } on FirebaseException catch (e) {
      //TODO catch with appError function
      throw AppError(code: e.code, message: e.message);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteDocument(String route, String id) async {
    try {
      await firestore.collection(route).doc(id).delete().timeout(
        Duration(seconds: 5),
        onTimeout: () {
          print('Get User Data Error Timeout');
          throw AppError.connectionTimeout();
        },
      );
    } on FirebaseException catch (e) {
      //TODO catch with appError function
      throw AppError(code: e.code, message: e.message);
    } on AppError catch (appError) {
      print(appError.code);
      print(appError.message);
      // rethrow;
    } catch (e) {
      print(e);
      rethrow;;
    }
  }

  @override
  Stream streamDocument(String route, String id) async* {
    yield firestore.collection(route).doc(id).snapshots().handleError(
          (error) => throw AppError(
            code: 'Stream error',
            message: error.toString(),
          ),
        );
  }

  @override
  Stream<QuerySnapshot> streamCollection(String route) async* {
    yield* firestore.collection(route).snapshots()
    // .handleError(
    //       (error) => throw AppError(
    //         code: 'Stream error',
    //         message: error.toString(),
    //       ),
    //     )
        ;
  }

  @override
  Future getCollection(String route) async {
    try {
      return await firestore.collection(route).get().timeout(
        Duration(seconds: 5),
        onTimeout: () {
          print('Get User Data Error Timeout');
          throw AppError.connectionTimeout();
        },
      );
    } on FirebaseException catch (e) {
      throw AppError(code: e.code, message: e.message);
    } on AppError catch (_) {
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> setCollection(String route) {
    // TODO: implement setCollection
    throw UnimplementedError();
  }
}
