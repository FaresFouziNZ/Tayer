class Booking {
  String bid;
  String uid;
  String fid;
  int classType;

  Booking({this.bid, this.classType, this.fid, this.uid});
  Map<String, dynamic> toMap() {
    return {'bid': bid, 'uid': uid, 'fid': fid, 'class_type': classType};
  }

  factory Booking.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    return Booking(
      uid: map['uid'],
      bid: map['bid'],
      fid: map['fid'],
      classType: map['class_type'],
    );
  }
}
