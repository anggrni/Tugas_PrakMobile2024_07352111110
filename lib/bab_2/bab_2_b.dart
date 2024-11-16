import 'dart:math';

// ENUM: Mendefinisikan fase-fase proyek di perusahaan
enum FaseProyek { Perencanaan, Pengembangan, Evaluasi }

// CLASS UTAMA: Karyawan (Abstract Class)
abstract class Karyawan {
  String nama;
  int umur;

  Karyawan(this.nama, this.umur);

  // Method abstrak bekerja() yang akan diimplementasikan oleh subclass
  void bekerja();
}

// MIXIN: Kinerja - Menambah atau mengurangi produktivitas
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

// SUBCLASS: KaryawanTetap (Inheritance dari Karyawan)
class KaryawanTetap extends Karyawan with Kinerja {
  KaryawanTetap(String nama, int umur) : super(nama, umur);

  @override
  void bekerja() {
    print('$nama bekerja sebagai Karyawan Tetap dengan produktivitas $produktivitas.');
  }
}

// SUBCLASS: KaryawanKontrak (Inheritance dari Karyawan)
class KaryawanKontrak extends Karyawan with Kinerja {
  DateTime tanggalMulai;
  DateTime tanggalAkhir;

  KaryawanKontrak(String nama, int umur, this.tanggalMulai, this.tanggalAkhir) : super(nama, umur);

  @override
  void bekerja() {
    print('$nama bekerja sebagai Karyawan Kontrak dari $tanggalMulai hingga $tanggalAkhir.');
  }
}

// SUBCLASS: Manager yang menggunakan Mixin Kinerja
class Manager extends Karyawan with Kinerja {
  Manager(String nama, int umur) : super(nama, umur) {
    produktivitas = max(produktivitas, 85); // Minimal produktivitas 85 untuk Manager
  }

  @override
  void bekerja() {
    print('$nama bekerja sebagai Manager dengan produktivitas $produktivitas.');
  }
}

// CLASS: Proyek - Mengelola fase proyek
class Proyek {
  String namaProyek;
  FaseProyek faseSaatIni = FaseProyek.Perencanaan;
  List<Karyawan> timProyek;

  Proyek(this.namaProyek, this.timProyek);

  // Method untuk memulai proyek
  void mulaiProyek() {
    print('Proyek $namaProyek dimulai pada fase ${faseSaatIni}.');
  }

  // Method untuk beralih ke fase berikutnya
  void beralihKeFaseBerikutnya() {
    if (faseSaatIni == FaseProyek.Perencanaan && timProyek.length >= 5) {
      faseSaatIni = FaseProyek.Pengembangan;
      print('Fase proyek berubah menjadi Pengembangan.');
    } else if (faseSaatIni == FaseProyek.Pengembangan) {
      faseSaatIni = FaseProyek.Evaluasi;
      print('Fase proyek berubah menjadi Evaluasi.');
    } else {
      print('Syarat untuk beralih fase tidak terpenuhi.');
    }
  }
}

void main() {
  // Membuat instance karyawan tetap dan kontrak
  var karyawanTetap = KaryawanTetap('Alice', 30);
  var karyawanKontrak = KaryawanKontrak('Bob', 28, DateTime.now(), DateTime.now().add(Duration(days: 90)));
  var manager = Manager('Charlie', 40);

  // Menjalankan fungsi bekerja() masing-masing karyawan
  karyawanTetap.bekerja();
  karyawanKontrak.bekerja();
  manager.bekerja();

  // Update produktivitas manager
  manager.updateProduktivitas(5);

  // Membuat proyek dengan tim yang terdiri dari beberapa karyawan
  var proyek = Proyek('Implementasi Sistem Keamanan', [karyawanTetap, karyawanKontrak, manager]);
  proyek.mulaiProyek();
  proyek.beralihKeFaseBerikutnya(); // Tes perubahan fase proyek
}
