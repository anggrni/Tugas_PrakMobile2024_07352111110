import 'dart:math';

// 1. Manajemen Produk Digital TongIT
class ProdukDigital {
  String namaProduk;
  double harga;
  String kategori;
  int jumlahTerjual;

  ProdukDigital(this.namaProduk, this.harga, this.kategori, this.jumlahTerjual) {
    if (kategori == 'NetworkAutomation' && harga <= 200000) {
      throw Exception('Harga NetworkAutomation harus minimal 200.000');
    } else if (kategori == 'DataManagement' && harga > 200000) {
      throw Exception('Harga DataManagement harus di bawah 200.000');
    }
  }

  void terapkanDiskon() {
    if (kategori == 'NetworkAutomation' && jumlahTerjual > 50) {
      double hargaSetelahDiskon = harga * 0.85;
      harga = max(hargaSetelahDiskon, 200000); // Harga tidak boleh di bawah 200.000
      print('Diskon 15% diterapkan. Harga baru: \$${harga.toStringAsFixed(2)}');
    } else {
      print('Diskon tidak berlaku untuk produk ini.');
    }
  }
}

// 2. Jenis Karyawan dan Peran
abstract class Karyawan {
  String nama;
  int umur;
  String peran;

  Karyawan(this.nama, {required this.umur, required this.peran});

  void bekerja();
}

class KaryawanTetap extends Karyawan {
  KaryawanTetap(String nama, {required int umur, required String peran}) 
      : super(nama, umur: umur, peran: peran);

  @override
  void bekerja() {
    print('$nama bekerja sebagai Karyawan Tetap dengan peran $peran.');
  }
}

class KaryawanKontrak extends Karyawan {
  DateTime tanggalMulai;
  DateTime tanggalAkhir;

  KaryawanKontrak(String nama, {required int umur, required String peran, required this.tanggalMulai, required this.tanggalAkhir}) 
      : super(nama, umur: umur, peran: peran);

  @override
  void bekerja() {
    print('$nama bekerja sebagai Karyawan Kontrak dari $tanggalMulai hingga $tanggalAkhir dengan peran $peran.');
  }
}

// 3. Mixin Kinerja untuk Produktivitas
mixin Kinerja {
  int produktivitas = 50;
  DateTime? tanggalUpdate;

  void updateProduktivitas(int nilai) {
    if (tanggalUpdate == null || DateTime.now().difference(tanggalUpdate!).inDays >= 30) {
      produktivitas = max(0, min(100, produktivitas + nilai));
      tanggalUpdate = DateTime.now();
      print('Produktivitas diperbarui menjadi $produktivitas');
    } else {
      print('Produktivitas hanya bisa diperbarui setiap 30 hari.');
    }
  }
}

class KaryawanManager extends Karyawan with Kinerja {
  KaryawanManager(String nama, {required int umur, required String peran}) 
      : super(nama, umur: umur, peran: peran) {
    produktivitas = max(produktivitas, 85);
  }

  @override
  void bekerja() {
    print('$nama bekerja sebagai Manager dengan produktivitas $produktivitas.');
  }
}

// 4. Manajemen Fase Proyek
enum FaseProyek { Perencanaan, Pengembangan, Evaluasi }

class Proyek {
  String namaProyek;
  FaseProyek faseSaatIni = FaseProyek.Perencanaan;
  List<Karyawan> timProyek;
  DateTime? tanggalMulai;

  Proyek(this.namaProyek, this.timProyek);

  void mulaiProyek() {
    tanggalMulai = DateTime.now();
    print('Proyek $namaProyek dimulai pada fase ${faseSaatIni}.');
  }

  void beralihKeFaseBerikutnya() {
    if (faseSaatIni == FaseProyek.Perencanaan && timProyek.length >= 5) {
      faseSaatIni = FaseProyek.Pengembangan;
      print('Fase proyek berubah menjadi Pengembangan.');
    } else if (faseSaatIni == FaseProyek.Pengembangan && tanggalMulai != null) {
      if (DateTime.now().difference(tanggalMulai!).inDays > 45) {
        faseSaatIni = FaseProyek.Evaluasi;
        print('Fase proyek berubah menjadi Evaluasi.');
      } else {
        print('Proyek belum berjalan lebih dari 45 hari.');
      }
    } else {
      print('Syarat untuk beralih fase tidak terpenuhi.');
    }
  }
}

// 5. Pengelolaan Karyawan Aktif dan Non-aktif
class Perusahaan {
  List<Karyawan> karyawanAktif = [];
  List<Karyawan> karyawanNonAktif = [];
  final int batasKaryawanAktif = 20;

  void tambahKaryawan(Karyawan karyawan) {
    if (karyawanAktif.length < batasKaryawanAktif) {
      karyawanAktif.add(karyawan);
      print('${karyawan.nama} ditambahkan sebagai karyawan aktif.');
    } else {
      print('Batas maksimal karyawan aktif tercapai.');
    }
  }

  void karyawanResign(Karyawan karyawan) {
    if (karyawanAktif.remove(karyawan)) {
      karyawanNonAktif.add(karyawan);
      print('${karyawan.nama} sekarang non-aktif.');
    } else {
      print('${karyawan.nama} tidak ditemukan di daftar karyawan aktif.');
    }
  }
}

void main() {
  // Contoh Penggunaan

  // Produk Digital
  var produk1 = ProdukDigital('Sistem Manajemen Data', 150000, 'DataManagement', 60);
  var produk2 = ProdukDigital('Sistem Otomasi Jaringan', 250000, 'NetworkAutomation', 55);

  produk1.terapkanDiskon();
  produk2.terapkanDiskon();

  // Karyawan
  var karyawanTetap = KaryawanTetap('Alice', umur: 30, peran: 'Developer');
  var karyawanKontrak = KaryawanKontrak('Bob', umur: 28, peran: 'NetworkEngineer', tanggalMulai: DateTime.now(), tanggalAkhir: DateTime.now().add(Duration(days: 90)));
  var manager = KaryawanManager('Charlie', umur: 40, peran: 'Manager');

  karyawanTetap.bekerja();
  karyawanKontrak.bekerja();
  manager.bekerja();

  // Evaluasi Kinerja
  manager.updateProduktivitas(5);

  // Proyek
  var proyek = Proyek('Implementasi Sistem Keamanan', [karyawanTetap, karyawanKontrak, manager]);
  proyek.mulaiProyek();
  proyek.beralihKeFaseBerikutnya(); // Tes fase proyek

  // Perusahaan
  var perusahaan = Perusahaan();
  perusahaan.tambahKaryawan(karyawanTetap);
  perusahaan.tambahKaryawan(karyawanKontrak);
  perusahaan.tambahKaryawan(manager);

  perusahaan.karyawanResign(karyawanTetap);
}
