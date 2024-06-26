class UserData {
  final String email;
  final String uid;

  UserData({required this.email, required this.uid});


  factory UserData.fromJson (Map<String, dynamic> json){
    return UserData(email: json['email'], uid: json['uid']);
  }

}