class Flight {
  String fid;
  String departure_location;
  String departure_date;
  String departure_time;
  String arrival_location;
  String arrival_date;
  String arrival_time;
  String inPlane;
  String planeName;
  int waitlist_count;
  Map<String,bool> seats;
  Flight(
      {this.fid,
      this.departure_location,
      this.departure_date,
      this.departure_time,
      this.arrival_location,
      this.arrival_date,
      this.arrival_time,
      this.inPlane,
      this.planeName,
      this.waitlist_count,
      this.seats});

  Map<String, dynamic> toMap() {
    return {
      'fid': fid,
      'departure_location': departure_location,
      'departure_date': departure_date,
      'departure_time': departure_time,
      'arrival_location': arrival_location,
      'arrival_date': arrival_date,
      'arrival_time': arrival_time,
      'planeName': planeName,
      'waitlist_count': waitlist_count,
      'seats': seats
    };
  }

  factory Flight.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    return Flight(
      fid: map['fid'],
      departure_location: map['departure_location'],
      departure_date: map['departure_date'],
      departure_time: map['departure_time'],
      arrival_location: map['arrival_location'],
      arrival_date: map['arrival_date'],
      arrival_time: map['arrival_time'],
      planeName: map['planeName'],
      waitlist_count: map['waitlist_count'],
      seats: map['seats'],
    );
  }
}
