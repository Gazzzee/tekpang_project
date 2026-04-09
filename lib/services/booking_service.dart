import 'package:url_launcher/url_launcher.dart';
import '../models/booking_models.dart';

class BookingService {
  // Nomor admin tujuan pesan WhatsApp.
  // Pastikan menggunakan format internasional, misalnya 62 untuk Indonesia.
  static const String _adminPhone = "62895336740040";

  static Future<bool> simpanDataKeSistem(BookingModel data) async {
    try {
      // Coba kirim data lewat WhatsApp.
      // Jika berhasil, kembalikan true.
      await kirimKeWhatsApp(data);
      return true;
    } catch (e) {
      // Jika terjadi error, tangkap dan kembalikan false.
      // Error bisa terjadi jika WhatsApp tidak dapat dibuka.
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
      // Jika WhatsApp terpasang, gunakan skema aplikasi WhatsApp.
      await launchUrl(whatsappAppUri, mode: LaunchMode.externalApplication);
    } else if (await canLaunchUrl(whatsappWebUri)) {
      // Jika aplikasi tidak tersedia, buka WhatsApp Web sebagai fallback.
      await launchUrl(whatsappWebUri, mode: LaunchMode.externalApplication);
    }
  }
}
