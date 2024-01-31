import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:project_ktp/data/datasource/ktp_remote_datasource.dart';
import 'package:project_ktp/data/datasource/provincies_remote_datasource.dart';
import 'package:project_ktp/data/datasource/regencies_remote_datasource.dart';
import 'package:project_ktp/data/local/local_storage.dart';
import 'package:project_ktp/data/models/ktp_model.dart';
import 'package:project_ktp/domain/entities/provincies_entities.dart';
import 'package:project_ktp/domain/entities/regencies_entities.dart';

class AddPage extends StatefulWidget {
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _ttlController = TextEditingController();
  TextEditingController _pekerjaanController = TextEditingController();
  TextEditingController _pendidikanController = TextEditingController();
  var initialProvinsi;
  var initialKabupaten;
  var provinsiId;
  late var box;

  @override
  void initState() {
    box = Hive.openBox<DataStorage>('local');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => context.go("/"), icon: Icon(Icons.people))
        ],
      ),
      body: Form(
          key: _formkey,
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _namaController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Data harus diisi";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Masukkan nama . . .",
                      label: Text("Nama")),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _ttlController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Data harus diisi";
                    } else {
                      return null;
                    }
                  },
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Data harus diisi";
                              } else {
                                return null;
                              }
                            },
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
                                initialKabupaten = null;
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
                        path: '/regencies.json',
                        provinsiId: provinsiId.toString()),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data!;
                        var listKabupaten = <String>[];
                        for (var i = 0; i < data.length; i++) {
                          listKabupaten.add(data[i].name.toString());
                        }
                        ;
                        return DropdownButtonFormField<String>(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Data harus diisi";
                              } else {
                                return null;
                              }
                            },
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
                  controller: _pekerjaanController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Data harus diisi";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Masukkan Pekerjaan . . .",
                      label: Text("Pekerjaan")),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _pendidikanController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Data harus diisi";
                    } else {
                      return null;
                    }
                  },
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
                      final isValid = _formkey.currentState!.validate();
                      if (!isValid) {
                        return null;
                      }
                      _formkey.currentState!.save();
                      setState(() {
                        Hive.openBox<DataStorage>('local');
                        late var box = Hive.box<DataStorage>('local');
                        box.add(DataStorage(
                            nama: _namaController.text,
                            ttl: _ttlController.text,
                            kabupaten: initialKabupaten,
                            provinsi: initialProvinsi,
                            pekerjaan: _pekerjaanController.text,
                            pendidikan: _pendidikanController.text));
                        // print(data);
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
