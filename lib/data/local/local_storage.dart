import 'package:hive/hive.dart';

part 'local_storage.g.dart';

@HiveType(typeId: 0)
class DataStorage extends HiveObject {
  @HiveField(0)
  late String nama;
  @HiveField(1)
  late String ttl;
  @HiveField(2)
  late String provinsi;
  @HiveField(3)
  late String kabupaten;
  @HiveField(4)
  late String pekerjaan;
  @HiveField(5)
  late String pendidikan;

  DataStorage({
    required this.nama,
    required this.ttl,
    required this.provinsi,
    required this.kabupaten,
    required this.pekerjaan,
    required this.pendidikan,
  });
}
