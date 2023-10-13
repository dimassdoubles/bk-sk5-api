import 'package:flutter/material.dart';
import 'package:studi_kasus_02/list_item.dart';
import 'package:studi_kasus_02/makanan.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<Makanan> _listMakanan = [
    Makanan(
      nama: "Bandeng Presto",
      deskripsi:
          "Wilayah Kota Semarang dikenal memiliki pesisir pantai sehingga banyak makanan dari Semarang yang memanfaatkan ikan sebagai makanan utama. Salah satunya bandeng presto. Cara membuat panganan ini adalah dengan teknik presto agar duri bandeng yang banyak bisa menjadi lunak. Jadi, saat menyantapnya tak perlu repot untuk memilah duri bandeng. Selain itu, rasanya yang nikmat membuat bandeng presto cocok untuk disantap bersama dengan nasi hangat dan sambal.",
      gambar: "assets/images/bandeng-presto.jpeg",
    ),
    Makanan(
      nama: "Lumpia",
      deskripsi:
          "Sebagai kota lumpia, rasanya kalau berkunjung ke Semarang tanpa mencicipi lumpia serasa seperti belum pernah ke sana. Makanan ini dibuat dengan adonan tepung yang dibuat bundar kemudian diberi isian lalu dilipat dan digulung, baru digoreng di minyak panas. Isian dari makanan dengan nama lain lunpia ini adalah daging ayam, bawang putih, telur orak-arik, ebi, kecap, potongan sayuran, bahkan rebung.",
      gambar: "assets/images/lunpia.jpeg",
    ),
    Makanan(
      nama: "Tahu Pong",
      deskripsi:
          "Beberapa waktu lalu, ada tahu bulat yang digoreng dadakan dengan harga 500-an dan sudah pasti kehalalannya. Namun jauh sebelum itu ternyata ada makanan khas Semarang bernama tahu pong dengan persamaannya adalah terbuat dari tahu dengan isian sama-sama kopong. Tidak hanya itu, bentuk keduanya juga sama, yakni bulat, walaupun tahu pong tidak sebulat tahu bulat. Namun tetap saja ada perbedaannya, yakni pada cara penyajian dan memakannya.Untuk tahu pong sendiri, biasanya akan dimakan bersama dengan gimbal udang (bakwan udang dengan bentuk pipih) dan sambal rawit pedas untuk dicocol. Di Semarang ada yang menjualnya di Jalan Gajah Mada No. 63B.",
      gambar: "assets/images/tahu-pong.jpeg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Makanan")),
      body: ListView.builder(
        itemCount: _listMakanan.length,
        itemBuilder: (context, index) {
          return ListItem(makanan: _listMakanan[index]);
        },
      ),
    );
  }
}
