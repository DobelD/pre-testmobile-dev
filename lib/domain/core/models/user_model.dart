class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  String? image;
  String? createdAt;

  UserModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.image,
      this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['image'] = image;
    data['created_at'] = createdAt;
    return data;
  }
}
