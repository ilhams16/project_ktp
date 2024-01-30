import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:project_ktp/domain/entities/provincies_entities.dart';

class GetProvinsi {
  static Future<List<Provinsi>> readJsonData({required String path}) async {
    final jsondata = await rootBundle.loadString(path);
    final list = jsonDecode(jsondata);
    final getList = <Provinsi>[];
    for (var i = 0; i < list.length; i++) {
      getList.add(Provinsi.fromJson(list[i]));
    }
    return getList;
  }
}
