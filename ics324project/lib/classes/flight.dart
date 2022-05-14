class Flight {
  String destination;
  String departure;
  String flightNumber;
  String dapTime;
  String arrTime;
  Flight({this.destination, this.departure, this.flightNumber, this.dapTime, this.arrTime});
  Map<String, dynamic> toMap() {
    return {'destination': destination, 'departure': departure, 'flightNumber': flightNumber, 'dapTime': dapTime};
  }

  factory Flight.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    return Flight(
      destination: map['destination'],
      departure: map['departure'],
      flightNumber: map['flightNumber'],
      dapTime: map['dapTime'],
      arrTime: map['arrTime'],
    );
  }
}
