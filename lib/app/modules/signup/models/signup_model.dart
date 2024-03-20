// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String userUid;
  String name;
  String email;
  String phoneNo;
  UserModel({
    required this.userUid,
    required this.name,
    required this.email,
    required this.phoneNo,
  });

  UserModel copyWith({
    String? userUid,
    String? name,
    String? email,
    String? phoneNo,
  }) {
    return UserModel(
      userUid: userUid ?? this.userUid,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNo: phoneNo ?? this.phoneNo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userUid': userUid,
      'name': name,
      'email': email,
      'phoneNo': phoneNo,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userUid: map['userUid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNo: map['phoneNo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(userUid: $userUid, name: $name, email: $email, phoneNo: $phoneNo)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.userUid == userUid &&
        other.name == name &&
        other.email == email &&
        other.phoneNo == phoneNo;
  }

  @override
  int get hashCode {
    return userUid.hashCode ^ name.hashCode ^ email.hashCode ^ phoneNo.hashCode;
  }
}
