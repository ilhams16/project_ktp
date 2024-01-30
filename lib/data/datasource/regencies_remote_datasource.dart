import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:project_ktp/domain/entities/regencies_entities.dart';

class GetKabupaten {
  static Future<List<Kabupaten>> readJsonData(
      {required String path, required String provinsiId}) async {
    // read json file
    final jsondata = await rootBundle.loadString(path);
    // decode json data as list
    final list = jsonDecode(jsondata);
    final getList = <Kabupaten>[];
    for (var i = 0; i < list.length; i++) {
      if (Kabupaten.fromJson(list[i]).provinceId == provinsiId) {
        getList.add(Kabupaten.fromJson(list[i]));
      }
    }
    return getList;
  }
}
