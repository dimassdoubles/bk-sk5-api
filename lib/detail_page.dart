import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studi_kasus_02/makanan.dart';

class DetailPage extends StatelessWidget {
  final Makanan _makanan;
  const DetailPage({super.key, required Makanan makanan}) : _makanan = makanan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_makanan.nama),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  _makanan.gambar,
                  fit: BoxFit.cover,
                  width: 1.sw,
                  height: 1.sw,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                _makanan.deskripsi,
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
