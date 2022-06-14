class UserModel {
  String uid;
  String email;
  String name;
  String firstname;

  UserModel({
    required this.email,
    required this.name,
    required this.uid,
    required this.firstname,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      firstname: json['firstname'],
      name: json['name'],
    );
  }
}