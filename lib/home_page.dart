import 'package:flutter/material.dart';
import 'package:studi_kasus_02/list_item.dart';
import 'package:studi_kasus_02/makanan.dart';
import 'package:studi_kasus_02/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            child: ListView.builder(
              itemCount: Makanan.examples.length,
              itemBuilder: (context, index) {
                return ListItem(makanan: Makanan.examples[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
