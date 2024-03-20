import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServicesModel {
  final String image;
  final String service;
  final String provider;
  final String rating;
  final String price;
  final String time;
  ServicesModel({
    required this.image,
    required this.service,
    required this.provider,
    required this.rating,
    required this.price,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'service': service,
      'provider': provider,
      'rating': rating,
      'price': price,
      'time': time,
    };
  }

  factory ServicesModel.fromMap(Map<String, dynamic> map) {
    return ServicesModel(
      image: map['image'] as String,
      service: map['service'] as String,
      provider: map['provider'] as String,
      rating: map['rating'] as String,
      price: map['price'] as String,
      time: map['time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServicesModel.fromJson(String source) =>
      ServicesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
