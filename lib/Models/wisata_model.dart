import 'package:flutter/material.dart';

class Kuliner {
  final String nama_kuliner;
  final String lokasi_kuliner ;
  final String deskripsi_kuliner;
  final String kategori_kuliner;
  final String rentang_harga;
  final String gambar_kuliner;

  const Kuliner({
    required this.nama_kuliner,
    required this.lokasi_kuliner,
    required this.deskripsi_kuliner,
    required this.kategori_kuliner,
    required this.rentang_harga,
    required this.gambar_kuliner,
  });
}
class Wisata {
  final String nama_wisata;
  final String lokasi_wisata;
  final String deskripsi_wisata;
  final String kategori_wisata;
  final int harga_tiket;
  final String gambar_wisata;

  const Wisata ({
    required this.nama_wisata,
    required this.lokasi_wisata,
    required this.deskripsi_wisata,
    required this.kategori_wisata,
    required this.harga_tiket,
    required this.gambar_wisata,
});
}