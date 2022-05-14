class Plane {
  DateTime date_of_first_flight;
  String pid;
  String type;
  Plane({this.date_of_first_flight, this.pid, this.type});
  Map<String, dynamic> toMap() {
    return {'date_of_first_flight': date_of_first_flight, 'pid': pid, 'type': type};
  }

  factory Plane.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    return Plane(
      date_of_first_flight: map['date_of_first_flight'],
      pid: map['pid'],
      type: map['type'],
    );
  }
}
