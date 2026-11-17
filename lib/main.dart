import 'package:flutter/material.dart';

// Import Views
import 'View/dashboard_view.dart';
import 'View/destinasi_list_view.dart';
import 'View/kuliner_list_view.dart';

import 'Models/wisata_model.dart';

// Import Controller Asli
import 'Controllers/dashboard_controller.dart';

void main() {
  runApp(const WisatuyApp());
}

class WisatuyApp extends StatelessWidget {
  const WisatuyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appController = DashboardController();

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
  final dynamic controller;

  const MainNavigationView({super.key, required this.controller});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  @override
  void initState() {
    super.initState();
    // Mendengarkan perubahan dari controller (ketika changeTab dipanggil)
    widget.controller.addListener(_onControllerChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    super.dispose();
  }

  // Fungsi untuk memperbarui tampilan saat tab di-trigger dari dashboard
  void _onControllerChanged() {
    if (mounted && widget.controller.currentIndex != _currentIndex) {
      setState(() {
        // Mengubah indeks halaman sesuai dengan yang diminta controller
        _currentIndex = widget.controller.currentIndex;
      });
    }
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF005E4D);

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
            // Memberitahu controller juga jika tab di-tap manual dari bottom bar
            widget.controller.changeTab?.call(index);
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