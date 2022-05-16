import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollections {
  static final _databaseref = FirebaseFirestore.instance;
  final CollectionReference users = _databaseref.collection('users');
  final CollectionReference flight = _databaseref.collection('flight');
  final CollectionReference passenger = _databaseref.collection('passenger');
  final CollectionReference plane = _databaseref.collection('plane');
  final CollectionReference seat = _databaseref.collection('seat');
  final CollectionReference ticket = _databaseref.collection('ticket');
  final CollectionReference booking = _databaseref.collection('booking');
}
