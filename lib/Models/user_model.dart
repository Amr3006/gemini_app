
class UserModel{
  late String name;
  late String email;
  late String uId;
  late String profilePicture;

  UserModel({
    required this.name,
    required this.email,
    required this.profilePicture,
    required this.uId
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    uId = json["uId"];
    profilePicture = json["profilePicture"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['uId'] = uId;
    data['profilePicture'] = profilePicture;
    return data;
  }
}