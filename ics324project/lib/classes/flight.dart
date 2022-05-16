class Flight {
  String arrival_location;
  String departure_location;
  String id;
  String departure_date;
  String arrival_date;
  String arrival_time;
  String departure_time;
  Flight(
      {this.arrival_location,
      this.departure_location,
      this.id,
      this.departure_date,
      this.arrival_date,
      this.arrival_time,
      this.departure_time});
  Map<String, dynamic> toMap() {
    return {
      'arrival_location': arrival_location,
      'departure_location': departure_location,
      'id': id,
      'departure_date': departure_date,
      'arrival_date': arrival_date,
      'arrival_time': arrival_time,
      'departure_time': departure_time
    };
  }

  factory Flight.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    return Flight(
      arrival_location: map['arrival_location'],
      departure_location: map['departure_location'],
      id: map['id'],
      departure_date: map['departure_date'],
      arrival_date: map['arrival_date'],
      departure_time: map['departure_time'],
      arrival_time: map['arrival_time'],
    );
  }
}
