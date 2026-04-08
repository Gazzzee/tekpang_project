class BookingModel {
  String? jenisKeperluan; // Servis / Perbaikan
  String? tingkatKesulitan; // Ringan, Sedang, Berat
  String? deskripsi;
  String? noWhatsapp;

  BookingModel({
    this.jenisKeperluan,
    this.tingkatKesulitan,
    this.deskripsi,
    this.noWhatsapp,
  });
}