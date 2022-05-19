class Booking {
  String bid;
  String fid;
  String uid;
  int classType;
  int price;
  bool is_waitlist;
  String seat;
  bool is_canceled;

  Booking(
      {this.bid,
      this.fid,
      this.uid,
      this.classType,
      this.price,
      this.is_waitlist,
      this.seat,
      this.is_canceled});
  Map<String, dynamic> toMap() {
    return {
      'bid': bid,
      'fid': fid,
      'uid': uid,
      'class_type': classType,
      'price': price,
      'is_waitlist': is_waitlist,
      'seat': seat,
      'is_canceled': is_canceled
    };
  }

  factory Booking.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    return Booking(
      bid: map['bid'],
      fid: map['fid'],
      uid: map['uid'],
      classType: map['class_type'],
      price: map['price'],
      is_waitlist: map['is_waitlist'],
      seat: map['seat'],
      is_canceled: map['is_canceled'],
    );
  }
}
