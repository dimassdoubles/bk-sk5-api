import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studi_kasus_02/makanan.dart';
import 'package:studi_kasus_02/styles.dart';

class DetailPage extends StatelessWidget {
  final Makanan _makanan;
  const DetailPage({super.key, required Makanan makanan}) : _makanan = makanan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              ImageHeader(makanan: _makanan),
              FoodName(makanan: _makanan),
              IconSection(makanan: _makanan),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  _makanan.detail,
                  textAlign: TextAlign.center,
                ),
              ),
              GambarLainSection(makanan: _makanan),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Bahan Racikan",
                style: textHeader1,
              ),
              const SizedBox(
                height: 16,
              ),
              BahanRacikanSection(makanan: _makanan)
            ],
          ),
        ),
      ),
    );
  }
}

class BahanRacikanSection extends StatelessWidget {
  const BahanRacikanSection({
    super.key,
    required Makanan makanan,
  }) : _makanan = makanan;

  final Makanan _makanan;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          ..._makanan.bahan.map(
            (e) => Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(e.values.first),
                    ),
                    Text(
                      e.keys.first,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GambarLainSection extends StatelessWidget {
  const GambarLainSection({
    super.key,
    required Makanan makanan,
  }) : _makanan = makanan;

  final Makanan _makanan;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          ..._makanan.gambarlain.map(
            (e) => Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SizedBox(
                width: 200,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    e,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconSection extends StatelessWidget {
  const IconSection({
    super.key,
    required Makanan makanan,
  }) : _makanan = makanan;

  final Makanan _makanan;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Icon(
                Icons.access_time_filled_rounded,
                size: 30,
                color: iconColor,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                _makanan.waktubuka,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.local_fire_department_rounded,
                size: 30,
                color: iconColor,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                _makanan.kalori,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.monetization_on_rounded,
                size: 30,
                color: iconColor,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                _makanan.harga,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FoodName extends StatelessWidget {
  const FoodName({
    super.key,
    required Makanan makanan,
  }) : _makanan = makanan;

  final Makanan _makanan;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: headerBackColor,
      ),
      child: Text(
        _makanan.deskripsi,
        textAlign: TextAlign.center,
        style: textHeader1.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}

class ImageHeader extends StatelessWidget {
  const ImageHeader({
    super.key,
    required Makanan makanan,
  }) : _makanan = makanan;

  final Makanan _makanan;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          _makanan.gambar,
          fit: BoxFit.cover,
          width: 1.sw,
          height: 1.sw,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.35),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              const FavoriteButton(),
            ],
          ),
        ),
      ],
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorited = !isFavorited;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Colors.white.withOpacity(0.50),
        ),
        child: Icon(
          isFavorited ? Icons.favorite_rounded : Icons.favorite_outline,
          color: Colors.red,
        ),
      ),
    );
  }
}
