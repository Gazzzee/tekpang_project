import 'package:url_launcher/url_launcher.dart';
import '../models/booking_models.dart';

class BookingService {
  // Ganti dengan nomor WhatsApp Anda (Gunakan kode negara, misal 62)
  static const String _adminPhone = "62895336740040";

  static Future<bool> simpanDataKeSistem(BookingModel data) async {
    try {
      await kirimKeWhatsApp(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> kirimKeWhatsApp(BookingModel data) async {
    String pesan =
        "Halo Admin, Saya butuh teknisi:\n\n"
        "*Layanan:* ${data.jenisKeperluan}\n"
        "*Tingkat:* ${data.tingkatKesulitan}\n"
        "*Masalah:* ${data.deskripsi}\n"
        "*Kontak WA:* ${data.noWhatsapp}";

    final whatsappAppUri = Uri.parse(
      "whatsapp://send?phone=$_adminPhone&text=${Uri.encodeComponent(pesan)}",
    );
    final whatsappWebUri = Uri.parse(
      "https://api.whatsapp.com/send?phone=$_adminPhone&text=${Uri.encodeComponent(pesan)}",
    );

    if (await canLaunchUrl(whatsappAppUri)) {
      await launchUrl(whatsappAppUri, mode: LaunchMode.externalApplication);
    } else if (await canLaunchUrl(whatsappWebUri)) {
      await launchUrl(whatsappWebUri, mode: LaunchMode.externalApplication);
    }
  }
}