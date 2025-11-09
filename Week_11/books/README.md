# Praktikum 11 - Pemrograman Asynchronous

## Farrel Muchammad Kafie
## 241720176

# Praktikum 1

### Langkah 1 - 5

```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo - Farrel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  bool isLoading = false;

  Future<http.Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/tFHCAgAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Future Demo - Farrel')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('GO'),
              onPressed: isLoading
                  ? null
                  : () {
                      setState(() {
                        isLoading = true;
                      });

                      getData()
                          .then((value) {
                            setState(() {
                              result = value.body.toString().substring(0, 450);
                            });
                          })
                          .catchError((_) {
                            setState(() {
                              result = 'Error occured';
                            });
                          })
                          .whenComplete(() {
                            setState(() {
                              isLoading = false;
                            });
                          });
                    },
            ),
            const Spacer(),
            Text(result),
            const Spacer(),
            if (isLoading) const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
```

### Soal 1

* Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.
```dart
return MaterialApp(
      title: 'Future Demo - Farrel',

appBar: AppBar(title: const Text('Future Demo - Farrel')),
```

* Carilah judul buku favorit Anda di Google Books
![img](/img/prak1-soal2.png)

* Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!
Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

```dart
onPressed: () {
  getData().then((value) {
    print(value.substring(0, 450)); 
  }).catchError((e) {
    print(e); 
  });
},
```
    Respons data (JSON) yang diterima dari Google Books API sangatlah besar, bisa ribuan karakter panjangnya. Jika kita melakukan `print(value)` begitu saja, konsol debug kita akan dipenuhi oleh teks yang sangat panjang. Oleh karena itu, `value.substring(0, 450)` digunakan untuk mencetak hanya 450 karakter pertama dari respons tersebut.


    catchError() akan menangkap exception (error) tersebut, yang disimpan dalam variabel e.
    
    Singkatnya:
    .then(...) dieksekusi jika Future berhasil.
    .catchError(...) dieksekusi jika Future gagal (error).

![gif](/img/W11-1.gif)

# Praktikum 2

```dart
onPressed: 
              isLoading
                  ? null
                  : () {
                    count();
```

![img](/img/W11-2.gif)

### Soal 4

Kode pada Langkah 2 menjalankan ketiga fungsi tersebut secara berurutan (sekuensial), bukan bersamaan. Karena setiap fungsi await (menunggu) fungsi sebelumnya selesai, total waktu yang dibutuhkan adalah penjumlahan dari semua durasi:

3 detik (untuk returnOneAsync) + 3 detik (untuk returnTwoAsync) + 3 detik (untuk returnThreeAsync) = Total 9 detik.

Inilah mengapa melihat delay 9 detik sebelum angka 6 (hasil dari 1 + 2 + 3) muncul di layar.


# Praktikum 3

![gif](/img/W11-3.gif)

* Soal 5

  Jelaskan maksud kode langkah 2 tersebut!
  Kode pada Langkah 2 mendemonstrasikan cara membuat dan mengontrol sebuah Future secara manual menggunakan objek Completer. `getNumber()` adalah fungsi yang "menjual tiket" (mengembalikan `Future`). `calculate()` adalah fungsi yang "melakukan pekerjaan" di belakang panggung. `completer.complete()` adalah sinyal dari `calculate` bahwa pekerjaan selesai dan hasilnya siap diambil oleh pemegang "tiket".

* Soal 6

  Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!

  Perbedaannya adalah Langkah 2+3 hanya menangani skenario sukses. Langkah 5+6 adalah implementasi asynchronous yang lengkap dan aman, karena ia mampu menangani skenario sukses (via .then) dan skenario gagal (via completeError dan .catchError) tanpa membuat aplikasi crash.

  ![gif](/img/W11-4.gif)

# Praktikum 4

* Soal 7
![gif](/img/W11-5.gif)

* Soal 8

  Jelaskan maksud perbedaan kode langkah 1 dan 4!

  Langkah 4 (`Future.wait`) adalah cara yang lebih modern, ringkas, dan standar di Dart untuk menjalankan beberapa futures secara paralel, sedangkan Langkah 1 (`FutureGroup`) adalah alternatif dari package eksternal yang menawarkan fleksibilitas lebih untuk skenario yang dinamis.

# Praktikum 5

* Soal 9
![img](/img/W11-6.gif)
![img](/img/prak5-langkah3.png)

* Soal 10

Panggil method handleError() tersebut di ElevatedButton, lalu run. Apa hasilnya? Jelaskan perbedaan kode langkah 1 dan 4!

  Langkah 1 (dan 2) menggunakan `.then()` / Callback Ini adalah cara "klasik" menangani `Future`. "merantai" (chaining) fungsi callback ke `Future` tersebut.

  Langkah 4 menggunakan `async/await` / `try-catch` Ini adalah cara yang lebih "modern" dan seringkali lebih mudah dibaca, karena membuat kode asinkron terlihat seperti kode sinkron

# Praktikum 6

* Soal 11
  
Tambahkan Nama dan Hasil Run
![img](/img/W11-7.png)

* Soal 12

Tambahkan Animasi Loading
```dart
  @override
  Widget build(BuildContext context) {
    final myWidget = myPosition == ''
        ? const CircularProgressIndicator()
        : Text(myPosition);
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location Farrel M Kafie')),
      body: Center(child: myWidget),
    );
  }
```
![img](/img/W11-8.gif)

Apakah Anda mendapatkan koordinat GPS ketika run di browser? Mengapa demikian?
TIDAK, Praktikum ini secara eksplisit memandu untuk menambahkan izin (permissions) di:

android/app/src/main/androidmanifest.xml (untuk Android)
ios/Runner/Info.plist (untuk iOS)

Tidak melakukan konfigurasi apapun untuk platform Web. Izin-izin tersebut hanya berlaku untuk perangkat mobile dan tidak ada gunanya saat dijalankan di browser. Browser memiliki sistem izinnya sendiri (yaitu pop-up yang meminta izin lokasi), tetapi itu pun tidak akan muncul jika syarat keamanan (poin 1) tidak terpenuhi.

# Praktikum 7

* Soal 13 & 14

Apakah ada perbedaan UI dengan praktikum sebelumnya? Mengapa demikian?

Perbedaannya adalah penanganan state loading.

Praktikum 6 (kode Anda) tidak menanganinya, sehingga layar terlihat kosong saat memuat. Praktikum 7 (dengan FutureBuilder) menanganinya secara otomatis, memberikan umpan balik visual (loading) yang jelas kepada pengguna.

![img](/img/W11-9.gif)

# Praktikum 8 

* Soal 15 & 16

Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda.

Cobalah klik setiap button, apa yang terjadi ? Mengapa demikian ?
Gantilah 3 warna pada langkah 5 dengan warna favorit Anda!

![img](/img/W11-10.gif)

# Praktikum 9

* Soal 17

Cobalah klik setiap button, apa yang terjadi ? Mengapa demikian ?

![img](/img/W11-11.gif)

Karena:

Panggil Dialog: Tombol "Change Color" memanggil method _showColorDialog(context).

Tampilkan & Tunggu: await showDialog(...) menampilkan AlertDialog di atas layar. barrierDismissible: false memblokir untuk menutupnya dengan mengklik di luar kotak.

Pilih Warna: Saat menekan tombol, misalnya TextButton "Red", fungsi onPressed di dalamnya dieksekusi.

Ubah State: color = Colors.red.shade700; — baris ini secara langsung mengubah nilai variabel color yang ada di _NavigationDialogScreenState.

Tutup Dialog: Navigator.pop(context, color); menutup AlertDialog.

Lanjutkan & Rebuild: Eksekusi kode kembali ke _showColorDialog dan baris setelah await dijalankan, yaitu setState(() {});.

setState adalah perintah untuk "membangun ulang" (rebuild) UI widget. Saat UI dibangun ulang, Scaffold akan membaca nilai color yang sudah baru (yaitu merah), dan tampilan latar belakang pun berubah.