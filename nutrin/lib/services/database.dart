import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobileapp/model/tracker.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference trackerCollection =
      Firestore.instance.collection('Tracker');

  // TODO: should use enum
  Future updateUserData(String name, bool metric, String sex, double height,
      double weight) async {
    return await trackerCollection.document(uid).setData({
      'name': name,
      'metric': metric,
      'sex': sex,
      'height': height,
      'weight': weight
    });
  }

  // get tracker stream
  Stream<Tracker> get tracker {
    return trackerCollection
        .document(uid)
        .snapshots()
        .map(_trackerFromSnapshot);
  }

  // get tracker list from snapshot
  Tracker _trackerFromSnapshot(DocumentSnapshot snapshot) {
    return Tracker(
        name: snapshot.data['name'] ?? '',
        sex: snapshot.data['sex'] ?? '',
        metric: snapshot.data['metric'] ?? true,
        height: snapshot.data['height'] ?? 0,
        weight: snapshot.data['weight']) ?? 0;
  }
}
