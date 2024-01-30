import 'package:hive/hive.dart';

// part 'data_storage.g.dart';

@HiveType(typeId: 0)
class DataStorage extends HiveObject {
  @HiveField(0)
  final String nama;
  @HiveField(1)
  final String ttl;
  @HiveField(2)
  final String provinsi;
  @HiveField(3)
  final String kabupaten;
  @HiveField(4)
  final String pekerjaan;
  @HiveField(5)
  final String pendidikan;

  DataStorage({
    required this.nama,
    required this.ttl,
    required this.provinsi,
    required this.kabupaten,
    required this.pekerjaan,
    required this.pendidikan,
  });
}
