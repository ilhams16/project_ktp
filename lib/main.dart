import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_ktp/application/core/services/router.dart';
import 'package:project_ktp/application/pages/add_page.dart';
import 'package:project_ktp/application/pages/list_page.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:project_ktp/data/datasource/ktp_remote_datasource.dart';
import 'package:project_ktp/data/local/local_storage.dart';

void main() async {
  DataLocalDataSource().openBox();
  Hive.registerAdapter(DataStorageAdapter());
  var box = await Hive.openBox<DataStorage>('local');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: RouterPage().getRouterPage(),
    );
  }
}
