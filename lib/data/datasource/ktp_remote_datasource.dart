import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_ktp/data/local/local_storage.dart';
import 'package:project_ktp/data/models/ktp_model.dart';

class DataLocalDataSource {
  DataLocalDataSource() {
    openBox();
  }

  void openBox() async {
    Hive.initFlutter();
    await Hive.openBox<DataStorage>('local');
  }

  Box getDataLocal() {
    final box = Hive.box<DataStorage>('local');
    return box;
  }

  Future<List<DataStorage>> getBox() async {
    final box = await getDataLocal();
    var listData = <DataStorage>[];
    for (var i = 0; i < box.length; i++) {
      listData.add(DataStorage(
          nama: box.get('nama'),
          ttl: box.get('ttl'),
          kabupaten: box.get('kabupaten'),
          provinsi: box.get('provinsi'),
          pekerjaan: box.get('pekerjaan'),
          pendidikan: box.get('pendidikan')));
    }
    return listData;
  }
}
