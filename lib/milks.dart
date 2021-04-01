import 'package:flutter/foundation.dart';

class Milks {
  final int price;
  final String name;

  Milks({
    @required this.price,
    @required this.name
  });

  factory Milks.fromJson(Map<String, dynamic> json) {
    return Milks(
      price: json['price'] as int,
      name: json['name'] as String
    );
  }
}