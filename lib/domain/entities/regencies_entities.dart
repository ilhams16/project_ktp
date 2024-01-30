// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';
import 'package:equatable/equatable.dart';

List<Kabupaten> kabupatenFromJson(String str) =>
    List<Kabupaten>.from(json.decode(str).map((x) => Kabupaten.fromJson(x)));

String kabupatenToJson(List<Kabupaten> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kabupaten extends Equatable {
  final String id;
  final String provinceId;
  final String name;
  final String altName;
  final double latitude;
  final double longitude;

  const Kabupaten({
    required this.id,
    required this.provinceId,
    required this.name,
    required this.altName,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props =>
      [id, provinceId, name, altName, latitude, longitude];

  factory Kabupaten.fromJson(Map<String, dynamic> json) => Kabupaten(
        id: json["id"],
        provinceId: json["province_id"],
        name: json["name"],
        altName: json["alt_name"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "province_id": provinceId,
        "name": name,
        "alt_name": altName,
        "latitude": latitude,
        "longitude": longitude,
      };
}
