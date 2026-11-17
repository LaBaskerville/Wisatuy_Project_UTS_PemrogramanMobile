import 'package:flutter/material.dart';

// Import Views
import 'View/dashboard_view.dart';
import 'View/destinasi_list_view.dart';
import 'View/kuliner_list_view.dart';

// TODO: Nanti temanmu yang menghandle Controller bisa mengimpor file controller asli di sini
// import 'Controllers/wisata_controller.dart';

void main() {
  runApp(const WisatuyApp());
}

class WisatuyApp extends StatelessWidget {
  const WisatuyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Ganti 'DummyController()' dengan Controller asli buatan temanmu nantinya
    final appController = DummyController();

    return MaterialApp(
      title: 'WISATUY',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF005E4D),
          primary: const Color(0xFF005E4D),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F9F8),
      ),
      home: MainNavigationView(controller: appController),
    );
  }
}

class MainNavigationView extends StatefulWidget {
  final dynamic controller; // Menerima controller dari tim

  const MainNavigationView({super.key, required this.controller});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF005E4D);

    // Menghubungkan halaman View dengan Controller yang dikirim dari atas
    final List<Widget> pages = [
      DashboardView(controller: widget.controller),
      DestinasiListView(controller: widget.controller),
      KulinerListView(controller: widget.controller),
    ];

    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFFEEEEEE))),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            // Jika nanti controller temanmu punya fungsi ganti tab, bisa dipanggil di sini:
            // widget.controller.changeTab(index);
          },
          selectedItemColor: primaryGreen,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              activeIcon: Icon(Icons.location_on),
              label: 'Destinasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_outlined),
              activeIcon: Icon(Icons.restaurant),
              label: 'Kuliner',
            ),
          ],
        ),
      ),
    );
  }
}

/// =====================================================================
/// DUMMY CONTROLLER SEMENTARA
/// (Catatan untuk Tim: Hapus class ini jika Controller asli sudah jadi,
/// lalu arahkan tipe data controller ke class asli buatan tim backend)
/// =====================================================================
class DummyController {
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

  final List daftarDestinasi = [];
  final List daftarKuliner = [];

  void changeTab(int index) {}
  void filterDashboardSearch(String val) {}
  void filterDestinasiSearch(String val) {}
  void filterDestinasiDaerah(String? val) {}
  void filterDestinasiKategori(String? val) {}
  void filterKulinerSearch(String val) {}
  void filterKulinerDaerah(String? val) {}
  void filterKulinerKategori(String? val) {}
  void bukaDetailDestinasi(BuildContext context, dynamic item) {}
  void bukaDetailKuliner(BuildContext context, dynamic item) {}
}