import 'package:flutter/material.dart';
import 'package:studi_kasus_02/list_item.dart';
import 'package:studi_kasus_02/makanan.dart';
import 'package:studi_kasus_02/makanan_repo.dart';
import 'package:studi_kasus_02/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Makanan>> _listMakanan;
  final MakananRepo _repo = MakananRepo();

  @override
  void initState() {
    super.initState();
    _listMakanan = _repo.getListMakanan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBgColor,
      appBar: AppBar(
        backgroundColor: headerBackColor,
        foregroundColor: Colors.white,
        title: const Text(
          "Kuliner Nusantara",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.list_alt_sharp,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "List Kuliner",
                style: textHeader1,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: FutureBuilder(
              future: _listMakanan,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListItem(makanan: snapshot.data![index]);
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Text("Error");
                } else {
                  return const Text("Loading");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
