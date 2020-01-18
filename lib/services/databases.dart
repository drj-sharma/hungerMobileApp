import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference

  final CollectionReference hungerCollection = Firestore.instance.collection('hungers');

  Future updateUserData(String pizzaSize, String name, String something) async {
    return await hungerCollection.document(uid).setData(
      {
        'pizzaSize': pizzaSize,
        'name': name,
        'somethingelse': something
      }
    );
  }
  // get hungers stream
  Stream<QuerySnapshot> get hungers {
    return hungerCollection.snapshots();
  }
}