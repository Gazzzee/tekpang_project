// Model data untuk menyimpan detail booking pengguna.
// Digunakan untuk mengirim data antar halaman.
class BookingModel {
  // Jenis layanan yang dipilih, misalnya Servis atau Perbaikan.
  String? jenisKeperluan; // Servis / Perbaikan
  // Tingkat kesulitan pekerjaan: Ringan, Sedang, atau Berat.
  String? tingkatKesulitan; // Ringan, Sedang, Berat
  // Deskripsi masalah tambahan yang diisi pengguna.
  String? deskripsi;
  // Nomor WhatsApp pengguna untuk dikirimkan ke admin.
  String? noWhatsapp;

  BookingModel({
    this.jenisKeperluan,
    this.tingkatKesulitan,
    this.deskripsi,
    this.noWhatsapp,
  });
}
