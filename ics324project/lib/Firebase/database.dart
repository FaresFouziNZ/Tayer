import 'package:flutter/widgets.dart';
import 'package:ics324project/Firebase/collection_ref.dart';

class DatabaseService extends ChangeNotifier {
  String uid;
  static DatabaseService _instance;
  final FirebaseCollections collections = FirebaseCollections();
}
