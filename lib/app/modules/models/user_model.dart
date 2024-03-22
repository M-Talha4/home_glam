// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String userUid;
  String name;
  String email;
  String phoneNo;
  String type;
  String location;
  String country;
  String? profileImage;
  UserModel({
    required this.userUid,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.type,
    required this.location,
    required this.country,
    this.profileImage,
  });

  UserModel copyWith({
    String? userUid,
    String? name,
    String? email,
    String? phoneNo,
    String? type,
    String? location,
    String? country,
    String? profileImage,
  }) {
    return UserModel(
      userUid: userUid ?? this.userUid,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNo: phoneNo ?? this.phoneNo,
      type: type ?? this.type,
      location: location ?? this.location,
      country: country ?? this.country,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userUid': userUid,
      'name': name,
      'email': email,
      'phoneNo': phoneNo,
      'type': type,
      'location': location,
      'country': country,
      'profileImage': profileImage,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userUid: map['userUid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNo: map['phoneNo'] as String,
      type: map['type'] as String,
      location: map['location'] as String,
      country: map['country'] as String,
      profileImage:
          map['profileImage'] != null ? map['profileImage'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(userUid: $userUid, name: $name, email: $email, phoneNo: $phoneNo, type: $type, location: $location, country: $country, profileImage: $profileImage)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.userUid == userUid &&
        other.name == name &&
        other.email == email &&
        other.phoneNo == phoneNo &&
        other.type == type &&
        other.location == location &&
        other.country == country &&
        other.profileImage == profileImage;
  }

  @override
  int get hashCode {
    return userUid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phoneNo.hashCode ^
        type.hashCode ^
        location.hashCode ^
        country.hashCode ^
        profileImage.hashCode;
  }
}
