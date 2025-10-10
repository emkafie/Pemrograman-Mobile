## Farrel Muchammad Kafie
## 2341720176

# flutter_plugin_pubdev

## Menambahkan Plugin auto_size_text
![img](/images/01.png)
![img](/images/02.png)

# Tugas Praktikum

## Maksud dari langkah 2

```dart
flutter pub get auto_size_text
```
Perintah ini adalah cara untuk menambahkan package eksternal ke dalam proyek Flutter. 

Setelah menjalankan perintah ini, dua hal akan terjadi secara otomatis:

File pubspec.yaml akan diperbarui dengan menambahkan auto_size_text: di bawah bagian dependencies.

Flutter akan mengunduh paket tersebut ke dalam proyek sehingga bisa mulai menggunakannya di kode.

## Maksud dari langkah 5

```dart
final String text;

const RedTextWidget({Key? key, required this.text}) : super(key: key);
```

Kode untuk membuat template widget kustom. Ini memastikan bahwa setiap kali Anda membuat RedTextWidget, Anda wajib memberikan sebuah teks (required this.text) yang nantinya tidak bisa diubah (final).

## Perbedaan Widget pada langkah 6

```dart
Container(
    color: Colors.amber,
    width: 200,
    child: const RedTextWidget(text: 'Hello, I am Red Text Widget'),
),
```

Menggunakan widget kustom (seperti RedTextWidget) untuk elemen UI yang tampilannya sama dan dipakai berulang kali di seluruh aplikasi.

```dart
Container(
    color: Colors.greenAccent,
    width: 100,
    child: const Text(
    'You have pushed the button this many times:',
    ),
),
```

Menggunakan widget standar (Text) dari Flutter untuk teks-teks umum atau yang gayanya hanya digunakan sesekali.

## Maksud tiap parameter auto_size_text

`text`: Isi teks/tulisan yang ingin ditampilkan.

`style`: Mengatur gaya visual teks (warna, tebal, jenis font).

`minFontSize`: Batas ukuran font paling kecil yang diizinkan.

`maxFontSize`: Batas ukuran font paling besar yang diizinkan.

`stepGranularity`: Mengatur interval/langkah saat mencoba mengecilkan ukuran font.

`presetFontSizes`: Menyediakan daftar ukuran font spesifik yang boleh dipilih.

`maxLines`: Membatasi jumlah baris maksimal untuk teks.

`group`: Menyamakan ukuran font antara beberapa widget AutoSizeText.

`overflow`: Mengatur tampilan jika teks tetap tidak muat (contoh: jadi titik-titik ...).

`overflowReplacement`: Menampilkan widget lain sebagai pengganti jika teks tidak muat.