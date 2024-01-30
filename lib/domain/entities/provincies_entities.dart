// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';
import 'package:equatable/equatable.dart';

List<Provinsi> provinsiFromJson(String str) =>
    List<Provinsi>.from(json.decode(str).map((x) => Provinsi.fromJson(x)));

String provinsiToJson(List<Provinsi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Provinsi extends Equatable {
  final String id;
  final String name;
  final String altName;
  final double latitude;
  final double longitude;

  const Provinsi({
    required this.id,
    required this.name,
    required this.altName,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [id, name, altName, latitude, longitude];

  factory Provinsi.fromJson(Map<String, dynamic> json) => Provinsi(
        id: json["id"],
        name: json["name"],
        altName: json["alt_name"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alt_name": altName,
        "latitude": latitude,
        "longitude": longitude,
      };
}
