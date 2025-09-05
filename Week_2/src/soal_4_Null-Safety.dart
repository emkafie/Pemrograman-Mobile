// Contoh Null Safety di Dart

void main() {
  // Variabel dengan null safety (tidak bisa null)
  String nama = "Budi";
  print(nama);

  // Variabel nullable (bisa null) dengan tanda '?'
  String? alamat;
  print(alamat); // Output: null

  // Menggunakan null-aware operator untuk menghindari error
  int? umur;
  print(umur ?? 0); // Jika umur null, maka output 0

  // Mengakses properti nullable dengan '!'
  alamat = "Jakarta";
  print(alamat!.length); // Menggunakan '!' karena yakin alamat tidak null
}
