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
    final isFormComplete = selectedLayanan != null && selectedLevel != null;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Teknisi Panggilan"),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue.shade900,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Visual Section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade50, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Stack(
                children: [
                  // Background texture dengan ikon perkakas samar
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.08,
                      child: Icon(
                        Icons.build,
                        size: 200,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 32,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon Header
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.construction,
                            color: Colors.blue.shade700,
                            size: 28,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Main Title
                        const Text(
                          "Mau servis apa hari ini?",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Subtitle
                        const Text(
                          "Pilih layanan teknisi terbaik kami.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Form Cards Section
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 20,
              ),
              child: Column(
                children: [
                  // Service Type Card
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButtonFormField<String>(
                          value: selectedLayanan,
                          hint: const Text("Pilih Jenis Keperluan"),
                          decoration: InputDecoration(
                            labelText: "Jenis Layanan",
                            labelStyle: TextStyle(color: Colors.grey.shade600),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.kitchen,
                              color: Colors.blue.shade600,
                              size: 20,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade50,
                          ),
                          items: [
                            "Servis",
                            "Perbaikan",
                          ]
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (val) =>
                              setState(() => selectedLayanan = val),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Difficulty Level Card
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButtonFormField<String>(
                          value: selectedLevel,
                          hint: const Text("Pilih Tingkat Kesulitan"),
                          decoration: InputDecoration(
                            labelText: "Tingkat Kesulitan",
                            labelStyle: TextStyle(color: Colors.grey.shade600),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.trending_up,
                              color: Colors.blue.shade600,
                              size: 20,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade50,
                          ),
                          items: [
                            "Ringan",
                            "Sedang",
                            "Berat",
                          ]
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (val) =>
                              setState(() => selectedLevel = val),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ),

                  // Pattern background dengan ikon samar di bawah
                  if (isFormComplete) ...[
                    const SizedBox(height: 32),
                    Stack(
                      children: [
                        Opacity(
                          opacity: 0.06,
                          child: Icon(
                            Icons.build_circle,
                            size: 150,
                            color: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Card(
                            color: Colors.blue.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Ringkasan Pesanan:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle,
                                        color: Colors.green.shade500,
                                        size: 24,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        "$selectedLayanan - $selectedLevel",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],

                  const SizedBox(height: 40),

                  // Order Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: isFormComplete
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        disabledBackgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: isFormComplete ? 4 : 0,
                      ),
                      child: Text(
                        "Pesan Mekanik",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isFormComplete ? Colors.white : Colors.grey,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}