import 'package:flutter/material.dart';
import 'package:project_ktp/data/datasource/provincies_remote_datasource.dart';
import 'package:project_ktp/data/datasource/regencies_remote_datasource.dart';
import 'package:project_ktp/domain/entities/provincies_entities.dart';
import 'package:project_ktp/domain/entities/regencies_entities.dart';

class AddPage extends StatefulWidget {
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _ttlController = TextEditingController();
  TextEditingController _pekerjaanController = TextEditingController();
  TextEditingController _pendidikanController = TextEditingController();
  var initialProvinsi;
  var initialKabupaten;
  var provinsiId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Diri"),
        centerTitle: true,
      ),
      body: Form(
          child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
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
              controller: _ttlController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukkan TTL . . .",
                  label: Text("TTL")),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  child: Expanded(child: Text("Provinsi")),
                ),
                FutureBuilder<List<Provinsi>>(
                    future: GetProvinsi.readJsonData(path: '/provinces.json'),
                    builder: (context, snapshot) {
                      var data = snapshot.data!;
                      var listProvinsi = <String>[];
                      for (var i = 0; i < data.length; i++) {
                        listProvinsi.add(data[i].name.toString());
                      }
                      return DropdownButton<String>(
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
                              ;
                            }
                            setState(() {
                              initialProvinsi = newValue!;
                              provinsiId = temp;
                              initialKabupaten = null;
                            });
                          });
                    }),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(child: Text("Kabupaten")),
                FutureBuilder<List<Kabupaten>>(
                    future: GetKabupaten.readJsonData(
                        path: '/regencies.json',
                        provinsiId: provinsiId.toString()),
                    builder: (context, snapshot) {
                      var data = snapshot.data!;
                      var listKabupaten = <String>[];
                      for (var i = 0; i < data.length; i++) {
                        listKabupaten.add(data[i].name.toString());
                      }
                      ;
                      return DropdownButton<String>(
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
                    }),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
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
              controller: _pendidikanController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukkan pendidikan",
                  label: Text("Pendidikan")),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Submit"))
          ],
        ),
      )),
    );
  }
}
