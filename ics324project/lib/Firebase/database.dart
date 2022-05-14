import 'package:flutter/widgets.dart';
import 'package:ics324project/Firebase/collection_ref.dart';
import 'package:ics324project/classes/flight.dart';

class DatabaseService extends ChangeNotifier {
  String uid;
  static DatabaseService _instance;
  final FirebaseCollections collections = FirebaseCollections();
  Stream<List<Flight>> get flights {
    return collections.flight.orderBy("status").snapshots().map((map) {
      List<Flight> list = [];
      for (var element in map.docs) {
        list.add(Flight.fromMap(element.data()));
      }
      return list;
    });
  }
}
