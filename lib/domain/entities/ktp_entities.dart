import 'package:equatable/equatable.dart';

class KTPEntity extends Equatable {
  final String nama;
  final String ttl;
  final String kabupaten;
  final String provinsi;
  final String pekerjaan;
  final String pendidikan;

  const KTPEntity({
    required this.nama,
    required this.ttl,
    required this.kabupaten,
    required this.provinsi,
    required this.pekerjaan,
    required this.pendidikan,
  });

  @override
  List<Object?> get props =>
      [nama, ttl, kabupaten, provinsi, pekerjaan, pendidikan];
}
