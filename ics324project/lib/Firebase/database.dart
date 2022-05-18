import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:ics324project/Firebase/collection_ref.dart';
import 'package:ics324project/classes/booking.dart';
import 'package:ics324project/classes/flight.dart';
import 'package:ics324project/classes/prog_user.dart';

class DatabaseService extends ChangeNotifier {
  String uid;
  static DatabaseService _instance;
  final FirebaseCollections collections = FirebaseCollections();

  static DatabaseService get instance {
    _instance ??= DatabaseService();

    return _instance;
  }

  // Stream<ProgUser> userById(String id) {
  //   return collections.users.doc(id).snapshots().map((event) => ProgUser.fromMap(event.data()));
  // }

  // Future setUserInfo() {}
  Future createUser({@required ProgUser user}) async {
    return await collections.users.doc(user.uid).set(user.toMap(), SetOptions(merge: true));
  }

  Future updateUser({@required ProgUser user}) async {
    return await collections.users.doc(user.uid).update(user.toMap());
  }

  Future<List<Flight>> flights(String dep, String arr, String date) async {
    QuerySnapshot flightsQuerySnapshot = await collections.flight
        .where('departure_location', isEqualTo: dep)
        .where('arrival_location', isEqualTo: arr)
        .where('departure_date', isEqualTo: date)
        .get();
    return flightDocsToList(flightsQuerySnapshot.docs);
  }

  List<Flight> flightDocsToList(List<DocumentSnapshot> documents) {
    List<Flight> list = [];
    for (var document in documents) {
      list.add(Flight.fromMap(document.data()));
    }
    return (list);
  }

  Future<Flight> flightById(id) async {
    return Flight.fromMap((await collections.flight.doc(id).get()).data());
  }

  Future<ProgUser> userById(id) async {
    return ProgUser.fromMap((await collections.users.doc(id).get()).data());
  }

  Future bookFlight(String flightId, String bookingId, int classType, String userId) async {
    await collections.flight.doc(flightId).update({
      'booked_seats': FieldValue.increment(1),
      'waitListed': FieldValue.arrayUnion([userId]),
    });
    return await collections.booking.doc(bookingId).set({
      'fid': flightId,
      'uid': userId,
      'class_type': classType,
      'bid': bookingId
      // TODO add last name
    });
  }
  // Future cancelTicket(String bookingId, String lastName) async {
  //   await collections.booking.doc(bookingId).get
  //   await collections.flight.doc(booking.data()['flight_id']).update({
  //     'booked_seats': FieldValue.increment(-1),
  //     'waitListed': FieldValue.arrayRemove([booking.data()['user_id']]),
  //   });
  //   return await collections.booking.doc(bookingId).delete();
  // }

  Future selectSeat(String bookingId, String seat, String userId, String flightId) async {
    // aka create ticket
    // await collections.booking.doc(bookingId).get().then((doc) => {data = doc.data()});
    await collections.flight.doc(flightId).update({
      'seat': {seat: userId}
    });

    return await collections.ticket.add({
      'id': bookingId,
      'seat': seat,
      'weights': '30kg',
      'user_id': uid,
    });
  }

  String createBookingRef() {
    String _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(6, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  Future<List<Booking>> getBooking(id) async {
    QuerySnapshot bookingQuerySnapshot = await collections.booking.where('uid', isEqualTo: id).get();
    return bookingDocsToList(bookingQuerySnapshot.docs);
  }

  List<Booking> bookingDocsToList(List<DocumentSnapshot> documents) {
    List<Booking> list = [];
    for (var document in documents) {
      list.add(Booking.fromMap(document.data()));
    }
    return (list);
  }
}
