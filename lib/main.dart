import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

// Aplikasi Flutter dimulai dari fungsi main.
// Fungsi ini memanggil runApp untuk menampilkan widget root.
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    ),
  );
}
