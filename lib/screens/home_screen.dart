import 'package:flutter/material.dart';
import '../models/booking_models.dart';
import 'form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedLayanan;
  String? selectedLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Teknisi Panggilan")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              hint: Text("Pilih Jenis Keperluan"),
              items: [
                "Servis",
                "Perbaikan",
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => selectedLayanan = val),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              hint: Text("Tingkat Kesulitan"),
              items: [
                "Ringan",
                "Sedang",
                "Berat",
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => selectedLevel = val),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: (selectedLayanan != null && selectedLevel != null)
                  ? () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => FormScreen(
                          booking: BookingModel(
                            jenisKeperluan: selectedLayanan,
                            tingkatKesulitan: selectedLevel,
                          ),
                        ),
                      ),
                    )
                  : null,
              child: Text("Pesan Mekanik"),
            ),
          ],
        ),
      ),
    );
  }
}