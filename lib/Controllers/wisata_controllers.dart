import 'package:flutter/material.dart';
import 'package:wisatuy/Models/wisata_model.dart';

/// Wrapper agar objek Wisata bisa dibaca dengan .nama, .lokasi, .imageUrl oleh DashboardView
class WisataDashboardItem {
  final Wisata data;
  WisataDashboardItem(this.data);

  String get nama => data.nama_wisata;
  String get lokasi => data.lokasi_wisata;
  String get deskripsi => data.deskripsi_wisata;
  String get kategori => data.kategori_wisata;
  int get hargaTiket => data.harga_tiket;
  String get imageUrl => data.gambar_wisata;
}

/// Wrapper agar objek Kuliner bisa dibaca dengan .nama, .lokasi, .imageUrl oleh DashboardView
class KulinerDashboardItem {
  final Kuliner data;
  KulinerDashboardItem(this.data);

  String get nama => data.nama_kuliner;
  String get lokasi => data.lokasi_kuliner;
  String get deskripsi => data.deskripsi_kuliner;
  String get kategori => data.kategori_kuliner;
  String get rentangHarga => data.rentang_harga;
  String get imageUrl => data.gambar_kuliner;
}

final List<Wisata> listWisata = [
  // --- SURABAYA PUSAT ---
  Wisata(
    nama_wisata: 'Taman Prestasi Surabaya',
    lokasi_wisata: 'Genteng, Surabaya Pusat',
    kategori_wisata: 'Taman Kota',
    harga_tiket: 0,
    deskripsi_wisata: 'Berlokasi di tepi Sungai Kalimas dengan fasilitas taman bermain dan area hijau. Sangat sejuk dan nyaman untuk bersantai di tengah kota.',
    gambar_wisata: 'Assets/Wisata/TamanPrestasiSurabaya.JPEG',
  ),
  Wisata(
    nama_wisata: 'Monumen Kapal Selam Surabaya',
    lokasi_wisata: 'Jl. Pemuda, Surabaya Pusat',
    kategori_wisata: 'Museum / Edukasi',
    harga_tiket: 15000,
    deskripsi_wisata: 'Museum kapal selam bersejarah milik KRI Pasopati 410. Pengalaman masuk ke dalam badan kapal selam memberikan edukasi sejarah yang menarik.',
    gambar_wisata: 'Assets/Wisata/MonumenKapalSelam.jpeg',
  ),
  Wisata(
    nama_wisata: 'Wisata Perahu Kalimas',
    lokasi_wisata: 'Jl. Ketabang Kali, Surabaya Pusat',
    kategori_wisata: 'Rekreasi Air',
    harga_tiket: 10000,
    deskripsi_wisata: 'Menawarkan pengalaman menyusuri sungai kota menggunakan perahu di malam hari. Lampu lampion di sepanjang sungai menciptakan pemandangan malam yang indah.',
    gambar_wisata: 'Assets/Wisata/WisataPerahukalimas.jpg',
  ),

  // --- SURABAYA UTARA ---
  Wisata(
    nama_wisata: 'Surabaya North Quay',
    lokasi_wisata: 'Pelabuhan Tanjung Perak, Surabaya Utara',
    kategori_wisata: 'Wisata Bahari',
    harga_tiket: 10000,
    deskripsi_wisata: 'Destinasi rooftop di Pelabuhan Tanjung Perak dengan pemandangan aktivitas kapal laut. Spot terbaik untuk menikmati matahari terbenam (sunset).',
    gambar_wisata: 'Assets/Wisata/SurabayaNorthQuay.jpg',
  ),
  Wisata(
    nama_wisata: 'Kota Tua Surabaya',
    lokasi_wisata: 'Kawasan Jembatan Merah, Surabaya Utara',
    kategori_wisata: 'Sejarah / Heritage',
    harga_tiket: 0,
    deskripsi_wisata: 'Kawasan bersejarah di sekitar Jembatan Merah dengan arsitektur kolonial tempo dulu. Sangat fotogenik dan cocok untuk wisata jalan kaki.',
    gambar_wisata: 'Assets/Wisata/KotaTuaSurabaya.jpg',
  ),
  Wisata(
    nama_wisata: 'Pantai Kenjeran Lama',
    lokasi_wisata: 'Kenjeran, Surabaya Utara',
    kategori_wisata: 'Pantai / Pesisir',
    harga_tiket: 10000,
    deskripsi_wisata: 'Wisata pesisir pantai tradisional yang menawarkan pemandangan laut lepas Madura. Pengunjung dapat menyewa perahu nelayan berkeliling laut.',
    gambar_wisata: 'Assets/Wisata/PantaiKenjeranLama.jpg',
  ),

  // --- SURABAYA TIMUR ---
  Wisata(
    nama_wisata: 'Hutan Bambu Keputih Surabaya',
    lokasi_wisata: 'Keputih, Surabaya Timur',
    kategori_wisata: 'Ekowisata / Alam',
    harga_tiket: 0,
    deskripsi_wisata: 'Hutan buatan rimbun dengan lorong-lorong pohon bambu ala hutan di Jepang. Sangat estetis untuk berfoto dan rekreasi gratis.',
    gambar_wisata: 'Assets/Wisata/hutanbambukeputih.jpg',
  ),
  Wisata(
    nama_wisata: 'Taman Mundu',
    lokasi_wisata: 'Tambaksari, Surabaya Timur',
    kategori_wisata: 'Taman Publik',
    harga_tiket: 0,
    deskripsi_wisata: 'Taman publik di depan Stadion Gelora 10 November Tambaksari dengan suasananya yang asri dan banyak pepohonan rindang.',
    gambar_wisata: 'Assets/Wisata/TamanMundu.JPEG',
  ),
  Wisata(
    nama_wisata: 'Taman Flora Bratang',
    lokasi_wisata: 'Gubeng, Surabaya Timur',
    kategori_wisata: 'Ruang Publik & Edukasi',
    harga_tiket: 0,
    deskripsi_wisata: 'Taman kota rindang dengan koleksi tanaman langka, taman rusa mini, dan area bermain anak.',
    gambar_wisata: 'Assets/Wisata/TamanFlora.webp',
  ),

  // --- SURABAYA BARAT ---
  Wisata(
    nama_wisata: 'Danau Unesa Lidah Wetan',
    lokasi_wisata: 'Lidah Wetan, Surabaya Barat',
    kategori_wisata: 'Danau / Olahraga',
    harga_tiket: 0,
    deskripsi_wisata: 'Danau buatan di kawasan kampus yang dikelilingi jalur lari dan jajanan rakyat. Suasananya sangat ramai dikunjungi saat akhir pekan pagi.',
    gambar_wisata: 'Assets/Wisata/DanauUnesa.jpg',
  ),
  Wisata(
    nama_wisata: 'Taman Mozaik',
    lokasi_wisata: 'Wiyung, Surabaya Barat',
    kategori_wisata: 'Taman Tematik',
    harga_tiket: 0,
    deskripsi_wisata: 'Taman tematik modern dengan instalasi bangunan kaca warna-warni yang unik. Arsitekturnya yang artsy sangat bagus untuk latar berfoto.',
    gambar_wisata: 'Assets/Wisata/TamanMozaik.webp',
  ),
  Wisata(
    nama_wisata: 'Jeruk City Park',
    lokasi_wisata: 'Lakarsantri, Surabaya Barat',
    kategori_wisata: 'Ruang Publik & Alam',
    harga_tiket: 0,
    deskripsi_wisata: 'Ruang terbuka hijau berkonsep agrowisata kebun buah jeruk dengan suasana asri, jalur jalan kaki yang teduh, dan area bersantai keluarga.',
    gambar_wisata: 'Assets/Wisata/JerukCityPark.jpg',
  ),

  // --- SURABAYA SELATAN ---
  Wisata(
    nama_wisata: 'Taman Pelangi',
    lokasi_wisata: 'Gayungan, Surabaya Selatan',
    kategori_wisata: 'Taman Kota',
    harga_tiket: 0,
    deskripsi_wisata: 'Taman kota populer di kawasan Gayungan dengan air mancur daun raksasa. Sangat indah dinikmati pada malam hari saat lampu menyala.',
    gambar_wisata: 'Assets/Wisata/TamanPelangi.jpg',
  ),
  Wisata(
    nama_wisata: 'Kebun Binatang Surabaya / Surabaya Zoo',
    lokasi_wisata: 'Wonokromo, Surabaya Selatan',
    kategori_wisata: 'Kebun Binatang / Edukasi',
    harga_tiket: 15000,
    deskripsi_wisata: 'Destinasi rekreasi satwa ikonik di jantung Surabaya Selatan. Areanya luas dan memiliki banyak koleksi fauna serta edukasi alam yang lengkap.',
    gambar_wisata: 'Assets/Wisata/KebunBinatangSurabaya.jpg',
  ),
  Wisata(
    nama_wisata: 'Taman Korea Surabaya',
    lokasi_wisata: 'Dr. Soetomo / Wonokromo, Surabaya Selatan',
    kategori_wisata: 'Ruang Publik',
    harga_tiket: 0,
    deskripsi_wisata: 'Taman tematik simbol kerja sama kota kembar Surabaya dan Busan dengan ornamen arsitektur tradisional Korea dan pepohonan rindang.',
    gambar_wisata: 'Assets/Wisata/TamanKorea.jpeg',
  ),
];

/// Controller filter untuk daftar destinasi wisata.
/// Menyimpan state pencarian/daerah/kategori dan menyediakan hasil yang sudah difilter.
class WisataController extends ChangeNotifier {
  String _search = '';
  String _daerah = 'Semua Daerah';
  String _kategori = 'Semua Kategori';

  String get searchQuery => _search;
  String get selectedDaerahDestinasi => _daerah;
  String get selectedKategoriDestinasi => _kategori;

  /// Opsi dropdown daerah, diambil otomatis dari data lokasi.
  List<String> get opsiDaerah {
    final daerah = <String>{'Semua Daerah'};
    for (final wisata in listWisata) {
      daerah.add(_daerahDariLokasi(wisata.lokasi_wisata));
    }
    return daerah.toList();
  }

  /// Opsi dropdown kategori, diambil otomatis dari data kategori.
  List<String> get opsiKategori {
    final kategori = <String>{'Semua Kategori'};
    for (final wisata in listWisata) {
      kategori.add(wisata.kategori_wisata);
    }
    return kategori.toList();
  }

  /// Daftar destinasi yang sudah difilter berdasarkan pencarian, daerah, dan kategori.
  List<Wisata> get daftarDestinasi {
    final kataKunci = _search.toLowerCase();
    return listWisata.where((wisata) {
      final cocokPencarian = kataKunci.isEmpty ||
          wisata.nama_wisata.toLowerCase().contains(kataKunci) ||
          wisata.lokasi_wisata.toLowerCase().contains(kataKunci);
      final cocokDaerah = _daerah == 'Semua Daerah' ||
          wisata.lokasi_wisata.toLowerCase().contains(_daerah.toLowerCase());
      final cocokKategori = _kategori == 'Semua Kategori' ||
          wisata.kategori_wisata.toLowerCase().contains(_kategori.toLowerCase());
      return cocokPencarian && cocokDaerah && cocokKategori;
    }).toList();
  }

  void filterDestinasiSearch(String val) {
    _search = val;
    notifyListeners();
  }

  void filterDestinasiDaerah(String? val) {
    _daerah = (val == null || val.isEmpty) ? 'Semua Daerah' : val;
    notifyListeners();
  }

  void filterDestinasiKategori(String? val) {
    _kategori = (val == null || val.isEmpty) ? 'Semua Kategori' : val;
    notifyListeners();
  }

  void resetFilterDestinasi() {
    _search = '';
    _daerah = 'Semua Daerah';
    _kategori = 'Semua Kategori';
    notifyListeners();
  }

  static String _daerahDariLokasi(String lokasi) {
    const wilayah = [
      'Surabaya Pusat',
      'Surabaya Utara',
      'Surabaya Timur',
      'Surabaya Barat',
      'Surabaya Selatan',
    ];
    final lokasiLower = lokasi.toLowerCase();
    for (final daerah in wilayah) {
      if (lokasiLower.contains(daerah.toLowerCase())) return daerah;
    }
    final bagian = lokasi.split(',').last.trim();
    return bagian.isEmpty ? lokasi : bagian;
  }
}
