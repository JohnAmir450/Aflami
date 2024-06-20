class UserModel {
  String? name;
  String? email;
  String? profileImage;
  

  UserModel({
    required this.name,
    required this.email,
    required this.profileImage,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    profileImage = json['profileImage'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'profileImage': profileImage,
    };
  }
}
