class UserModel {
  late String name;
  late String email;
  late String profilePicture;

  UserModel({
    required this.name,
    required this.email,
    required this.profilePicture,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    profilePicture = json["profilePicture"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['profilePicture'] = profilePicture;
    return data;
  }

  UserModel clone() {
    return UserModel(name: name, email: email, profilePicture: profilePicture);
  }
}
