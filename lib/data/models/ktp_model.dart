import 'package:equatable/equatable.dart';
import 'package:project_ktp/domain/entities/ktp_entities.dart';

class KTPModel extends KTPEntity with EquatableMixin {
  KTPModel({
    required String nama,
    required String ttl,
    required String kabupaten,
    required String provinsi,
    required String pekerjaan,
    required String pendidikan,
  }) : super(
          nama: nama,
          ttl: ttl,
          kabupaten: kabupaten,
          provinsi: provinsi,
          pekerjaan: pekerjaan,
          pendidikan: pendidikan,
        );
  Map<String, dynamic> toDataStorage() => {
        "nama": nama,
        "ttl": ttl,
        "kabupaten": kabupaten,
        "provinsi": provinsi,
        "pekerjaan": pekerjaan,
        "pendidikan": pendidikan,
      };
}
