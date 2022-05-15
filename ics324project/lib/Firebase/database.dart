import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:ics324project/Firebase/collection_ref.dart';
import 'package:ics324project/classes/flight.dart';
import 'package:ics324project/classes/user.dart';

class DatabaseService extends ChangeNotifier {
  String uid;
  static DatabaseService _instance;
  final FirebaseCollections collections = FirebaseCollections();

  static DatabaseService get instance {
    _instance ??= DatabaseService();

    return _instance;
  }

  Stream<List<Flight>> flightsQue(String dep, String arr, String date) {
    return collections.flight
        .where('Departure_Location', isEqualTo: dep)
        .where('Arrival_Location', isEqualTo: arr)
        .snapshots()
        .map((map) {
      List<Flight> list = [];
      for (var element in map.docs) {
        list.add(Flight.fromMap(element.data()));
      }
      return list;
    });
  }

  Stream<ProgUser> userById(String id) {
    return collections.users.doc(id).snapshots().map((event) => ProgUser.fromMap(event.data()));
  }

  // Future setUserInfo() {}
  Future createUser({@required ProgUser user}) async {
    return await collections.users.doc(user.uid).set(user.toMap(), SetOptions(merge: true));
  }
}
