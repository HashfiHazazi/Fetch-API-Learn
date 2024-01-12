class Quran {
  final int no;
  final String nameSurahAr;
  final String nameSurahId;
  final int totalAyat;
  final String tempatTurun;
  final String artiSurah;
  final String deskripsi;

  Quran(
      {required this.no,
      required this.nameSurahAr,
      required this.nameSurahId,
      required this.totalAyat,
      required this.tempatTurun,
      required this.artiSurah,
      required this.deskripsi});

  factory Quran.fromJson(Map<String, dynamic> json) {
    return Quran(
        no: json['nomor'],
        nameSurahAr: json['nama'],
        nameSurahId: json['nama_latin'],
        totalAyat: json['jumlah_ayat'],
        tempatTurun: json['tempat_turun'],
        artiSurah: json['arti'],
        deskripsi: json['deskripsi']);
  }
}
