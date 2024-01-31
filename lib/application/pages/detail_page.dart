import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_ktp/data/local/local_storage.dart';

class DetailPage extends StatefulWidget {
  late DataStorage data;
  DetailPage({required this.data});

  @override
  State<DetailPage> createState() => _DetailPageState(data: data);
}

class _DetailPageState extends State<DetailPage> {
  late DataStorage data;
  _DetailPageState({required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => context.go("/"), icon: Icon(Icons.people)),
          IconButton(
              onPressed: () {
                context.go('/edit', extra: data);
              },
              icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        title: const Text("Konfrimasi"),
                        content: const Text("Anda yakin ingin menghapus data?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                data.delete();
                              });
                              context.go('/');
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    }));
                // setState(() {
                //   data.delete();
                // });
                // context.go('/');
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: Card(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  margin: EdgeInsets.all(10),
                  child: Text("Nama"),
                ),
                Container(
                  child: Text(":"),
                ),
                Expanded(
                    child: Center(
                  child: Text('${this.data.nama}'),
                ))
              ],
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  margin: EdgeInsets.all(10),
                  child: Text("TTL"),
                ),
                Container(
                  child: Text(":"),
                ),
                Expanded(
                    child: Center(
                  child: Text('${this.data.ttl}'),
                ))
              ],
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  margin: EdgeInsets.all(10),
                  child: Text("Provinsi"),
                ),
                Container(
                  child: Text(":"),
                ),
                Expanded(
                    child: Center(
                  child: Text('${this.data.provinsi}'),
                ))
              ],
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  margin: EdgeInsets.all(10),
                  child: Text("Kabupaten"),
                ),
                Container(
                  child: Text(":"),
                ),
                Expanded(
                    child: Center(
                  child: Text('${this.data.kabupaten}'),
                ))
              ],
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  margin: EdgeInsets.all(10),
                  child: Text("Pekerjaan"),
                ),
                Container(
                  child: Text(":"),
                ),
                Expanded(
                    child: Center(
                  child: Text('${this.data.pekerjaan}'),
                ))
              ],
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  margin: EdgeInsets.all(10),
                  child: Text("Pendidikan"),
                ),
                Container(
                  child: Text(":"),
                ),
                Expanded(
                    child: Center(
                  child: Text('${this.data.pendidikan}'),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
