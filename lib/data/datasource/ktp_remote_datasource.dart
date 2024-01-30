import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DataLocalDataSouceImpl {
  DataLocalDataSouceImpl() {
    openBox();
  }

  void openBox() async {
    Hive.initFlutter();
    await Hive.openBox('local');
  }

  Box getDataLocal() {
    final box = Hive.box('local');
    return box;
  }
}
