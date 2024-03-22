import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AccountModel {
  String imagePath;
  String title;
  AccountModel({
    required this.imagePath,
    required this.title,
  });

  AccountModel copyWith({
    String? imagePath,
    String? title,
  }) {
    return AccountModel(
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imagePath': imagePath,
      'title': title,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      imagePath: map['imagePath'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AccountModel(imagePath: $imagePath, title: $title)';

  @override
  bool operator ==(covariant AccountModel other) {
    if (identical(this, other)) return true;

    return other.imagePath == imagePath && other.title == title;
  }

  @override
  int get hashCode => imagePath.hashCode ^ title.hashCode;
}
