import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hunger/models/objectModel.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference

  final CollectionReference hungerCollection =
      Firestore.instance.collection('hungers');

  Future updateUserData(String pizzaSize, String name, String something) async {
    return await hungerCollection.document(uid).setData(
        {'pizzaSize': pizzaSize, 'name': name, 'somethingelse': something});
  }

  // firebase object conversion to our data-model object conversion
  List<ItemObject> itemObjectFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents
        .map((doc) => ItemObject(
            name: doc.data['name'] ?? '',
            pizzaSize: doc.data['pizzaSize'] ?? '',
            somethingElse: doc.data['somethingelse'] ?? ''))
        .toList();
  }

  // get hungers stream
  Stream<List<ItemObject>> get hungers {
    return hungerCollection.snapshots().map(itemObjectFromSnapshot);
  }

  // get user data
  Stream<DocumentSnapshot> get userData {
    return hungerCollection.document(uid).snapshots();
  }
}
