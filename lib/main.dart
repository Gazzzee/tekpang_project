import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

// Aplikasi Flutter dimulai dari fungsi main.
// Fungsi ini memanggil runApp untuk menampilkan widget root.
void main() {
  // Titik masuk aplikasi Flutter.
  // runApp menjalankan widget root aplikasi.
  runApp(
    MaterialApp(
      // Menghilangkan label debug pada tampilan saat aplikasi dijalankan.
      debugShowCheckedModeBanner: false,
      // Menentukan tema warna utama aplikasi.
      theme: ThemeData(primarySwatch: Colors.blue),
      // Halaman awal yang ditampilkan saat aplikasi dibuka.
      home: HomeScreen(),
      // MaterialApp juga mengatur navigator dan route default.
      // Di sini kita hanya menggunakan home sebagai route utama.
    ),
  );
}
