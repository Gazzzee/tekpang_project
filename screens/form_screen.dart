import 'package:flutter/material.dart';
import 'package:tekpang_project/models/booking_models.dart';
import 'package:tekpang_project/services/booking_service.dart';
import 'package:tekpang_project/screens/success_screen.dart';

class FormScreen extends StatefulWidget {
  final BookingModel booking;
  const FormScreen({super.key, required this.booking});

  @override
  // ignore: library_private_types_in_public_api
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _descCtrl = TextEditingController();
  final _waCtrl = TextEditingController();
  bool _isLoading = false;

  void _prosesSubmit() async {
    setState(() => _isLoading = true);

    widget.booking.deskripsi = _descCtrl.text;
    widget.booking.noWhatsapp = _waCtrl.text;

    bool sukses = await BookingService.simpanDataKeSistem(widget.booking);

    if (!mounted) return;

    setState(() => _isLoading = false);

    if (sukses) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SuccessScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Konfirmasi Pesanan")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ringkasan Layanan:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "${widget.booking.jenisKeperluan} - ${widget.booking.tingkatKesulitan}",
              ),
              SizedBox(height: 20),
              TextField(
                controller: _descCtrl,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Jelaskan detail masalah",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _waCtrl,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Nomor WhatsApp",
                  prefixText: "+62 ",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _prosesSubmit,
                  child: _isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text("SUBMIT PESANAN"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
