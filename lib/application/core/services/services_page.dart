import 'package:flutter/material.dart';
import 'package:project_ktp/data/datasource/ktp_remote_datasource.dart';
import 'package:project_ktp/data/models/ktp_model.dart';
import 'package:project_ktp/domain/entities/ktp_entities.dart';

class PageProvider extends ChangeNotifier {
  String nama = '';
  String ttl = '';
  String kabupaten = '';
  String provinsi = '';
  String pekerjaan = '';
  String pendidikan = '';

  KTPModel get getAllData {
    return KTPModel(
        nama: nama,
        ttl: ttl,
        kabupaten: kabupaten,
        provinsi: provinsi,
        pekerjaan: pekerjaan,
        pendidikan: pendidikan);
  }

  void getData() {
    var box = DataLocalDataSource().getDataLocal();
    nama = box.get(nama);
    ttl = box.get(nama);
    kabupaten = box.get(nama);
    provinsi = box.get(nama);
    pekerjaan = box.get(nama);
    pendidikan = box.get(nama);
    notifyListeners();
  }
}
