class UserModel {
  int? id;
  String? email;
  String? name;
  String? profilePhoto;

  UserModel({this.email, this.name, this.id,this.profilePhoto});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
    profilePhoto: json["profilePhoto"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "email": email ?? '',
        "profilePhoto": profilePhoto ?? '',
        "name": name ?? '',
      };
}
