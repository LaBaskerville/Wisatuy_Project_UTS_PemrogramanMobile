import 'package:flutter/material.dart';
import 'package:wisatuy/Models/wisata_model.dart';

final List<Kuliner> listKuliner = [
  // --- SURABAYA PUSAT ---
  Kuliner(
    nama_kuliner: 'Sentra Wisata Kuliner Embong Sawo',
    lokasi_kuliner: 'Embong Malang, Surabaya Pusat',
    kategori_kuliner: 'Street Food',
    rentang_harga: 'Rp 15.000 - Rp 35.000',
    deskripsi_kuliner: 'Pusat jajanan dan makanan lokal favorit para pekerja kantoran di pusat kota dengan pilihan kulinernya yang sangat beragam.',
    gambar_kuliner: 'Assets/Kuliner/SentraWisataKulinerEmbongSawo.png',
  ),
  Kuliner(
    nama_kuliner: 'Warung Bu Kris',
    lokasi_kuliner: 'Jl. Tenggilis / Area Surabaya Pusat',
    kategori_kuliner: 'Warung',
    rentang_harga: 'Rp 25.000 - Rp 60.000',
    deskripsi_kuliner: 'Legenda kuliner penyetan khas Surabaya dengan sambal terasi mangga muda yang khas serta tingkat kepedasan yang bisa disesuaikan.',
    gambar_kuliner: 'Assets/Kuliner/WarungBuKris.png',
  ),
  Kuliner(
    nama_kuliner: 'Sego Sambel Mak Yeye',
    lokasi_kuliner: 'Jl. Jagir Wonokromo Wetan, Surabaya Pusat',
    kategori_kuliner: 'Warung',
    rentang_harga: 'Rp 15.000 - Rp 30.000',
    deskripsi_kuliner: 'Warung malam legendaris penyetan ikan pari dengan sambal super pedas. Antrean pembelinya selalu panjang hingga larut malam.',
    gambar_kuliner: 'Assets/Kuliner/SegoSambelMakYeye.png',
  ),

  // --- SURABAYA UTARA ---
  Kuliner(
    nama_kuliner: 'Arte Coffee',
    lokasi_kuliner: 'Bulak, Surabaya Utara',
    kategori_kuliner: 'Kafe',
    rentang_harga: '25000-50000',
    deskripsi_kuliner: 'Kafe santai di kawasan pesisir Pantai Ria Kenjeran yang cocok untuk bersantai dan menikmati berbagai sajian kopi dari pagi hingga malam hari.',
    gambar_kuliner: 'Assets/Kuliner/artecoffee.png',
  ),
  Kuliner(
    nama_kuliner: 'Sego Sadukan Haji Suwaji',
    lokasi_kuliner: 'Surabaya Utara',
    kategori_kuliner: 'Warung',
    rentang_harga: 'Rp 10.000 - Rp 25.000',
    deskripsi_kuliner: 'Kuliner nasi bungkus porsi kecil dengan lauk sedap yang buka 24 jam. Rasanya gurih khas rumahan dan sangat praktis.',
    gambar_kuliner: 'Assets/Kuliner/SegoSadukanHajiSuwaji.png',
  ),
  Kuliner(
    nama_kuliner: 'Rawon Pak Pangat Wonokromo',
    lokasi_kuliner: 'Wonokromo, Surabaya Utara',
    kategori_kuliner: 'Warung',
    rentang_harga: 'Rp 25.000 - Rp 50.000',
    deskripsi_kuliner: 'Warung rawon legendaris dengan kuah hitam pekat berempah kuat serta krengsengan. Daging sapinya empuk dan gurih.',
    gambar_kuliner: 'Assets/Kuliner/RawonPakPangatWonokromo.png',
  ),

  // --- SURABAYA TIMUR ---
  Kuliner(
    nama_kuliner: 'Warung Kuning - Kalibokor',
    lokasi_kuliner: 'Kalibokor, Surabaya Timur',
    kategori_kuliner: 'Warung',
    rentang_harga: 'Rp 15.000 - Rp 35.000',
    deskripsi_kuliner: 'Warung makan klasik dengan pilihan menu masakan nusantara yang variatif. Rasanya rumahan banget seperti masakan ibu sendiri.',
    gambar_kuliner: 'Assets/Kuliner/WarungKuningKalibokor.png',
  ),
  Kuliner(
    nama_kuliner: 'Mang Kabayan Surabaya',
    lokasi_kuliner: 'Surabaya Timur',
    kategori_kuliner: 'Restoran',
    rentang_harga: 'Rp 40.000 - Rp 100.000',
    deskripsi_kuliner: 'Restoran bernuansa Sunda dengan saung bambu dan kolam ikan yang asri. Menu gurame bakar dan karedoknya sangat lezat.',
    gambar_kuliner: 'Assets/Kuliner/MangKabayanSurabaya.png',
  ),
  Kuliner(
    nama_kuliner: 'Sentra Wisata Kuliner Dharmahusada',
    lokasi_kuliner: 'Dharmahusada, Surabaya Timur',
    kategori_kuliner: 'Street Food',
    rentang_harga: 'Rp 15.000 - Rp 45.000',
    deskripsi_kuliner: 'Pusat kuliner malam populer yang menawarkan berbagai pilihan makanan khas dengan tempat ramai dan ragam menu lezat.',
    gambar_kuliner: 'Assets/Kuliner/SentraWisataKulinerDharmahusada.png',
  ),

  // --- SURABAYA BARAT ---
  Kuliner(
    nama_kuliner: 'GWalk Food Centre Surabaya Barat',
    lokasi_kuliner: 'Citraland, Surabaya Barat',
    kategori_kuliner: 'Street Food',
    rentang_harga: 'Rp 25.000 - Rp 75.000',
    deskripsi_kuliner: 'Kawasan sentra kuliner jalanan malam hari terbesar di Surabaya Barat dengan pilihan kulinernya dari lokal hingga mancanegara.',
    gambar_kuliner: 'Assets/Kuliner/GWalkFoodCentreSurabaya Barat.png',
  ),
  Kuliner(
    nama_kuliner: 'Kartiko Heritage Darmo Permai',
    lokasi_kuliner: 'Darmo Permai, Surabaya Barat',
    kategori_kuliner: 'Restoran',
    rentang_harga: 'Rp 20.000 - Rp 50.000',
    deskripsi_kuliner: 'Restoran dan pusat jajanan pasar tradisional dengan konsep klasik nan elegan. Aneka kue tradisional dan bakminya lezat.',
    gambar_kuliner: 'Assets/Kuliner/KartikoHeritageDarmoPermai.png',
  ),
  Kuliner(
    nama_kuliner: 'Depot Bu Indra Surabaya Barat',
    lokasi_kuliner: 'Surabaya Barat',
    kategori_kuliner: 'Restoran',
    rentang_harga: 'Rp 20.000 - Rp 45.000',
    deskripsi_kuliner: 'Warung makan favorit keluarga dengan menu masakan nusantara rumahan yang lezat, pelayanan ramah, dan tempat bersih.',
    gambar_kuliner: 'Assets/Kuliner/DepotBuIndraSurabaya Barat.png',
  ),

  // --- SURABAYA SELATAN ---
  Kuliner(
    nama_kuliner: 'Sentra Wisata Kuliner Karah',
    lokasi_kuliner: 'Jambangan, Surabaya Selatan',
    kategori_kuliner: 'Street Food',
    rentang_harga: 'Rp 15.000 - Rp 35.000',
    deskripsi_kuliner: 'Terletak strategis di kawasan Jambangan, menyuguhkan berbagai pilihan menu lezat dengan harga terjangkau dan tempat bersih.',
    gambar_kuliner: 'Assets/Kuliner/SentraWisataKulinerKarah.png',
  ),
  Kuliner(
    nama_kuliner: 'Sentra Wisata Kuliner Ketintang',
    lokasi_kuliner: 'Ketintang, Surabaya Selatan',
    kategori_kuliner: 'Street Food',
    rentang_harga: 'Rp 15.000 - Rp 40.000',
    deskripsi_kuliner: 'Pusat jajanan malam populer di kawasan Ketintang dengan pilihan menu beragam, tempatnya luas, dan mudah diakses kendaraan.',
    gambar_kuliner: 'Assets/Kuliner/SentraWisataKulinerKetintang.png',
  ),
  Kuliner(
    nama_kuliner: 'Bebek Sinjay Ahmad Yani',
    lokasi_kuliner: 'Gayungan, Surabaya Selatan',
    kategori_kuliner: 'Kuliner',
    rentang_harga: '25000-50000',
    deskripsi_kuliner: 'Restoran bebek goreng khas Madura yang populer di jalur utama Surabaya Selatan dengan ciri khas sambal pencit segar.',
    gambar_kuliner: 'Assets/Kuliner/bebeksinjay.png',
  ),
];
