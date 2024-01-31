import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:project_ktp/application/core/services/services_page.dart';
import 'package:project_ktp/data/datasource/ktp_remote_datasource.dart';
import 'package:project_ktp/data/local/local_storage.dart';
import 'package:project_ktp/data/models/ktp_model.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var data = Hive.box<DataStorage>('local');
  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty) {
      return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () => context.go("/add"), icon: Icon(Icons.add)),
            ],
            title: Text("Data"),
          ),
          body: ListView(
            children: List.generate(data.length, (index) {
              return GestureDetector(
                onTap: () {
                  context.go("/detail", extra: data.get(index));
                },
                child: Card(
                  child: Column(
                    children: [
                      Text('${data.get(index)?.nama}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('${data.get(index)?.pekerjaan}')
                    ],
                  ),
                ),
              );
            }),
          ));
    } else {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => context.go("/add"), icon: Icon(Icons.add)),
          ],
          title: Text("Data"),
        ),
        body: Center(child: Text("Data Kosong")),
      );
    }
  }
}
