class UserData {
  String? name;
  final String email;
  final String uid;

  UserData({required this.email, required this.uid, this.name});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      email: json['email'],
      uid: json['uid'],
    );
  }
}
