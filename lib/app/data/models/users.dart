class UserModel {
  String? name;
  String? id;
  String? phoneNumber;
  String? password;
  String? role;
  String? imageUrl;

  UserModel({
    this.name,
    this.id,
    this.phoneNumber,
    this.password,
    this.role,
    this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      role: json['role'],
      password: json['password'],
      imageUrl: json['imageUrl'],
    );
  }
  Map<String, dynamic> get toJosn => <String, dynamic>{
        'id': id,
        'name': name,
        'phoneNumber': phoneNumber,
        'role': role,
        'password': password,
        'imageUrl': imageUrl,
      };

  UserModel copyWith({
    String? name,
    String? id,
    String? phoneNumber,
    String? password,
    String? role,
    String? imageUrl,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        role: role ?? this.role,
        password: password ?? this.password,
        imageUrl: imageUrl ?? this.imageUrl,
      );
}
