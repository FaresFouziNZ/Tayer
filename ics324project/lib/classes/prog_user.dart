class ProgUser {
  String firstName;
  String lastName;
  int age;
  String uid;
  bool isAdmin;
  ProgUser({this.age, this.firstName, this.lastName, this.uid, this.isAdmin});
  Map<String, dynamic> toMap() {
    return {'firstName': firstName, 'lastName': lastName, 'age': age, 'uid': uid, 'isAdmin': isAdmin};
  }

  factory ProgUser.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    return ProgUser(
      firstName: map['firstName'],
      lastName: map['lastName'],
      age: map['age'],
      uid: map['uid'],
      isAdmin: map['isAdmin'],
    );
  }
  isAdminFunc() {}
  book() {}
  editBooking() {}

  waitList() {}
}
