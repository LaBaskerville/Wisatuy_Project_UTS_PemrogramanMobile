import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  final dynamic controller; // Menerima controller dari luar

  const DashboardView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF005E4D);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Hijau khas WISATUY
              Container(
                color: primaryGreen,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.diamond, color: Colors.white, size: 28),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'WISATUY',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                letterSpacing: 1,
                              ),
                            ),
                            Text(
                              'SURABAYA',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 10,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: (val) => controller.filterDashboardSearch?.call(val),
                      decoration: InputDecoration(
                        hintText: 'Cari destinasi atau kuliner...',
                        prefixIcon: const Icon(Icons.search, color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Jelajahi Surabaya, Rayhan!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Temukan tempat menarik dan kuliner khas kota.',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),

              // Destinasi Unggulan Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Destinasi Unggulan',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () => controller.changeTab?.call(1),
                          child: const Text(
                            'Lihat Semua',
                            style: TextStyle(
                              color: primaryGreen,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildCardUnggulan(
                      context: context,
                      title: controller.destinasiUnggulan?.nama ?? 'Jalan Tunjungan',
                      subtitle: controller.destinasiUnggulan?.lokasi ?? 'Surabaya Pusat',
                      imageUrl: controller.destinasiUnggulan?.imageUrl ?? '',
                      onTap: () => controller.bukaDetailDestinasi?.call(context, controller.destinasiUnggulan),
                    ),
                    const SizedBox(height: 20),

                    // Kuliner Populer Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Kuliner Populer',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () => controller.changeTab?.call(2),
                          child: const Text(
                            'Lihat Semua',
                            style: TextStyle(
                              color: primaryGreen,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildCardUnggulan(
                      context: context,
                      title: controller.kulinerPopuler?.nama ?? 'Rawon Setan',
                      subtitle: controller.kulinerPopuler?.lokasi ?? 'Surabaya Pusat',
                      imageUrl: controller.kulinerPopuler?.imageUrl ?? '',
                      onTap: () => controller.bukaDetailKuliner?.call(context, controller.kulinerPopuler),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardUnggulan({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String imageUrl,
    required VoidCallback onTap,
  }) {
    return Container(
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
            child: imageUrl.isNotEmpty
                ? (imageUrl.startsWith('http')
                ? Image.network(imageUrl, height: 160, width: double.infinity, fit: BoxFit.cover)
                : Image.asset(
              imageUrl,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 160,
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.image_not_supported, color: Colors.grey),
                ),
              ),
            ))
                : Container(height: 160, color: Colors.grey[300]),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 2),
                    Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE6F2F0),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text(
                    'Lihat',
                    style: TextStyle(color: Color(0xFF005E4D), fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}