import 'package:flutter/material.dart';

class KulinerListView extends StatelessWidget {
  final dynamic controller; // Menerima controller dari luar

  const KulinerListView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF005E4D);
    final List list = controller.daftarKuliner ?? [];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),
      appBar: AppBar(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        title: const Text('Kuliner Khas Jawa Timur', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Baris Filter dan Pencarian
          Container(
            color: const Color(0xFFF7F9F8),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  onChanged: (val) => controller.filterKulinerSearch?.call(val),
                  decoration: InputDecoration(
                    hintText: 'Cari kuliner khas Surabaya...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE0E0E0)),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: controller.selectedDaerahKuliner ?? 'Semua Daerah',
                            isExpanded: true,
                            items: (controller.opsiDaerah as List<String>? ?? ['Semua Daerah'])
                                .map((d) => DropdownMenuItem(value: d, child: Text(d, style: const TextStyle(fontSize: 12))))
                                .toList(),
                            onChanged: (val) => controller.filterKulinerDaerah?.call(val),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE0E0E0)),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: controller.selectedKategoriKuliner ?? 'Semua Kategori',
                            isExpanded: true,
                            items: (controller.opsiKategori as List<String>? ?? ['Semua Kategori'])
                                .map((k) => DropdownMenuItem(value: k, child: Text(k, style: const TextStyle(fontSize: 12))))
                                .toList(),
                            onChanged: (val) => controller.filterKulinerKategori?.call(val),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          // Grid View Tampilan Kuliner
          Expanded(
            child: list.isEmpty
                ? const Center(child: Text('Kuliner tidak ditemukan'))
                : GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.82,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];
                return GestureDetector(
                  onTap: () => controller.bukaDetailKuliner?.call(context, item),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.network(item.gambar_kuliner, height: 110, width: double.infinity, fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.nama_kuliner,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(item.lokasi_kuliner, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}