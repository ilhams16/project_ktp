import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:project_ktp/data/datasource/provincies_remote_datasource.dart';
import 'package:project_ktp/data/datasource/regencies_remote_datasource.dart';
import 'package:project_ktp/data/local/local_storage.dart';
import 'package:project_ktp/domain/entities/provincies_entities.dart';
import 'package:project_ktp/domain/entities/regencies_entities.dart';

class EditPage extends StatefulWidget {
  late DataStorage data;
  EditPage({required this.data});
  @override
  State<EditPage> createState() => _EditPageState(data: data);
}

class _EditPageState extends State<EditPage> {
  final DataStorage data;
  _EditPageState({required this.data});
  var _namaController;
  var _ttlController;
  var _pekerjaanController;
  var _pendidikanController;
  var initialProvinsi;
  var initialKabupaten;
  late TextEditingController provinsiId = TextEditingController();
  var box;

  @override
  void initState() {
    box = Hive.openBox<DataStorage>('local');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initialProvinsi = this.data.provinsi;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => context.go("/"), icon: Icon(Icons.people))
        ],
      ),
      body: Form(
          child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: data.nama,
              controller: _namaController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukkan nama . . .",
                  label: Text("Nama")),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: data.ttl,
              controller: _ttlController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukkan TTL . . .",
                  label: Text("TTL")),
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder<List<Provinsi>>(
                future: GetProvinsi.readJsonData(path: '/provinces.json'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data!;
                    var listProvinsi = <String>[];
                    for (var i = 0; i < data.length; i++) {
                      listProvinsi.add(data[i].name.toString());
                    }
                    return DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Provinsi"),
                        ),
                        value: initialProvinsi,
                        items: listProvinsi
                            .map<DropdownMenuItem<String>>((String index) {
                          return DropdownMenuItem<String>(
                              value: index,
                              child: Text(
                                index,
                              ));
                        }).toList(),
                        onChanged: (String? newValue) {
                          var temp;
                          for (var i = 0; i < listProvinsi.length; i++) {
                            if (data[i].name == newValue) {
                              temp = data[i].id.toString();
                            }
                          }
                          setState(() {
                            initialProvinsi = newValue!;
                            provinsiId = temp;
                          });
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            SizedBox(
              height: 20,
            ),
            FutureBuilder<List<Kabupaten>>(
                future: GetKabupaten.readJsonData(
                    path: '/regencies.json', provinsiId: provinsiId.toString()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data!;
                    var listKabupaten = <String>[];
                    for (var i = 0; i < data.length; i++) {
                      listKabupaten.add(data[i].name.toString());
                    }
                    ;
                    return DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Kabupaten"),
                        ),
                        value: initialKabupaten,
                        items: listKabupaten
                            .map<DropdownMenuItem<String>>((String index) {
                          return DropdownMenuItem<String>(
                              value: index,
                              child: Text(
                                index,
                              ));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            initialKabupaten = newValue!;
                          });
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            //   ],
            // ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: data.pekerjaan,
              controller: _pekerjaanController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukkan Pekerjaan . . .",
                  label: Text("Pekerjaan")),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: data.pendidikan,
              controller: _pendidikanController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukkan pendidikan",
                  label: Text("Pendidikan")),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  var datas = Hive.box<DataStorage>('local');
                  var index = 0;
                  for (var i = 0; i < datas.length; i++) {
                    if (this.data.nama == datas.get(i)?.nama &&
                        this.data.ttl == datas.get(i)?.ttl) {
                      index = i;
                    }
                  }
                  setState(() {
                    // Hive.openBox<DataStorage>('local');
                    late var box = Hive.box<DataStorage>('local');
                    box.putAt(
                        index,
                        DataStorage(
                            nama: _namaController.text,
                            ttl: _ttlController.text,
                            kabupaten: initialKabupaten,
                            provinsi: initialProvinsi,
                            pekerjaan: _pekerjaanController.text,
                            pendidikan: _pendidikanController.text));
                  });
                  context.go('/');
                },
                child: Text("Submit"))
          ],
        ),
      )),
    );
  }
}
