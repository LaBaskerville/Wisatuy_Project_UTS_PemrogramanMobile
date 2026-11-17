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

class DashboardController extends ChangeNotifier {
  String _searchQuery = '';
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  String get searchQuery => _searchQuery;

  // Data Wisata Surabaya (Disesuaikan untuk gambar lokal assets)
  final List<Wisata> _listWisata = [
    const Wisata(
      nama_wisata: 'Taman Prestasi Surabaya',
      lokasi_wisata: 'Genteng, Surabaya Pusat',
      kategori_wisata: 'Taman Kota',
      harga_tiket: 0,
      deskripsi_wisata: 'Berlokasi di tepi Sungai Kalimas dengan fasilitas taman bermain dan area hijau. Sangat sejuk dan nyaman untuk bersantai di tengah kota.',
      gambar_wisata: 'Assets/Wisata/TamanPrestasiSurabaya.JPEG',
    ),
    const Wisata(
      nama_wisata: 'Monumen Kapal Selam Surabaya',
      lokasi_wisata: 'Jl. Pemuda, Surabaya Pusat',
      kategori_wisata: 'Museum / Edukasi',
      harga_tiket: 15000,
      deskripsi_wisata: 'Museum kapal selam bersejarah milik KRI Pasopati 410. Pengalaman masuk ke dalam badan kapal selam memberikan edukasi sejarah yang menarik.',
      gambar_wisata: 'Assets/Wisata/MonumenKapalSelam.jpeg',
    ),
  ];

  // Data Kuliner Surabaya (Disesuaikan untuk gambar lokal assets)
  final List<Kuliner> _listKuliner = [
    const Kuliner(
      nama_kuliner: 'Sentra Wisata Kuliner Embong Sawo',
      lokasi_kuliner: 'Embong Malang, Surabaya Pusat',
      kategori_kuliner: 'Street Food',
      rentang_harga: 'Rp 15.000 - Rp 35.000',
      deskripsi_kuliner: 'Pusat jajanan dan makanan lokal favorit para pekerja kantoran di pusat kota dengan pilihan kulinernya yang sangat beragam.',
      gambar_kuliner: 'Assets/Kuliner/SentraWisataKulinerEmbongSawo.png',
    ),
    const Kuliner(
      nama_kuliner: 'Rujak Cingur Ahmad Jais',
      lokasi_kuliner: 'Genteng, Surabaya',
      deskripsi_kuliner:
      'Rujak khas Surabaya dengan bumbu petis udang pilihan dan irisan cingur empuk.',
      kategori_kuliner: 'Makanan Berat',
      rentang_harga: 'Rp 30.000 - Rp 45.000',
      gambar_kuliner: 'assets/images/rujak.jpg',
    ),
  ];

  // Getter Destinasi Unggulan yang mendukung Filter Pencarian
  WisataDashboardItem? get destinasiUnggulan {
    final query = _searchQuery.trim().toLowerCase();

    // Jika kolom pencarian kosong, kembalikan item pertama sebagai default
    if (query.isEmpty) {
      return _listWisata.isNotEmpty ? WisataDashboardItem(_listWisata.first) : null;
    }

    // Cari yang sesuai dengan query pencarian (nama atau lokasi)
    final hasil = _listWisata.where((w) =>
    w.nama_wisata.toLowerCase().contains(query) ||
        w.lokasi_wisata.toLowerCase().contains(query) ||
        w.kategori_wisata.toLowerCase().contains(query));

    return hasil.isNotEmpty ? WisataDashboardItem(hasil.first) : null;
  }

  // Getter Kuliner Populer yang mendukung Filter Pencarian
  KulinerDashboardItem? get kulinerPopuler {
    final query = _searchQuery.trim().toLowerCase();

    // Jika kolom pencarian kosong, kembalikan item pertama sebagai default
    if (query.isEmpty) {
      return _listKuliner.isNotEmpty ? KulinerDashboardItem(_listKuliner.first) : null;
    }

    // Cari yang sesuai dengan query pencarian (nama atau lokasi)
    final hasil = _listKuliner.where((k) =>
    k.nama_kuliner.toLowerCase().contains(query) ||
        k.lokasi_kuliner.toLowerCase().contains(query) ||
        k.kategori_kuliner.toLowerCase().contains(query));

    return hasil.isNotEmpty ? KulinerDashboardItem(hasil.first) : null;
  }

  // Dipanggil oleh TextField: controller.filterDashboardSearch?.call(val)
  void filterDashboardSearch(String val) {
    _searchQuery = val;
    notifyListeners(); // Memicu UI untuk memperbarui tampilan secara reaktif
  }

  // Dipanggil oleh tombol 'Lihat Semua': controller.changeTab?.call(1) / (2)
  void changeTab(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // Pop-up Detail Destinasi saat tombol 'Lihat' ditekan
  void bukaDetailDestinasi(BuildContext context, dynamic item) {
    if (item == null) return;
    final Wisata wisataAsli = item is WisataDashboardItem ? item.data : item;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            wisataAsli.nama_wisata,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: _buildPopupImage(wisataAsli.gambar_wisata),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Lokasi: ${wisataAsli.lokasi_wisata}',
                    style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Kategori: ${wisataAsli.kategori_wisata}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Harga Tiket: ${wisataAsli.harga_tiket}',
                    style: const TextStyle(
                      color: Color(0xFF005E4D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text('Deskripsi:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(wisataAsli.deskripsi_wisata),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Tutup', style: TextStyle(color: Color(0xFF005E4D))),
            ),
          ],
        );
      },
    );
  }

  // Pop-up Detail Kuliner saat tombol 'Lihat' ditekan
  void bukaDetailKuliner(BuildContext context, dynamic item) {
    if (item == null) return;
    final Kuliner kulinerAsli = item is KulinerDashboardItem ? item.data : item;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            kulinerAsli.nama_kuliner,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: _buildPopupImage(kulinerAsli.gambar_kuliner),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Lokasi: ${kulinerAsli.lokasi_kuliner}',
                    style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Kategori: ${kulinerAsli.kategori_kuliner}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Rentang Harga: ${kulinerAsli.rentang_harga}',
                    style: const TextStyle(
                      color: Color(0xFF005E4D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text('Deskripsi:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(kulinerAsli.deskripsi_kuliner),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Tutup', style: TextStyle(color: Color(0xFF005E4D))),
            ),
          ],
        );
      },
    );
  }

  // Helper gambar untuk Pop-up (mendukung lokal & URL)
  Widget _buildPopupImage(String path) {
    if (path.startsWith('http')) {
      return Image.network(path, height: 150, width: double.infinity, fit: BoxFit.cover);
    }
    return Image.asset(
      path,
      height: 150,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        height: 150,
        color: Colors.grey[300],
        child: const Center(child: Icon(Icons.image_not_supported, color: Colors.grey)),
      ),
    );
  }

  // =====================================================================
  // PENYANGGA UNTUK TAB LAIN (Agar DestinasiListView & KulinerListView tidak error)
  // =====================================================================
  String selectedDaerahDestinasi = 'Semua Daerah';
  String selectedKategoriDestinasi = 'Semua Kategori';
  String selectedDaerahKuliner = 'Semua Daerah';
  String selectedKategoriKuliner = 'Semua Kategori';

  final List<String> opsiDaerah = const [
    'Semua Daerah',
    'Surabaya Pusat',
    'Surabaya Selatan',
    'Surabaya Timur',
    'Surabaya Utara',
    'Surabaya Barat',
  ];

  final List<String> opsiKategori = const [
    'Semua Kategori',
    'Sejarah',
    'Alam',
    'Hiburan',
    'Makanan Berat',
    'Jajanan',
  ];

  List<Wisata> get daftarDestinasi => _listWisata;
  List<Kuliner> get daftarKuliner => _listKuliner;

  void filterDestinasiSearch(String val) {}
  void filterDestinasiDaerah(String? val) {}
  void filterDestinasiKategori(String? val) {}
  void filterKulinerSearch(String val) {}
  void filterKulinerDaerah(String? val) {}
  void filterKulinerKategori(String? val) {}
}