# Laporan Praktikum Pemrogramman Mobile

| Nama | NIM | Kelas |
|---|---|---|
| Farrel Muchammad Kafie | 2341720176 | TI-3H |

## Praktikum 1
**Soal 1**

Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.
Gantilah warna tema aplikasi sesuai kesukaan Anda.

```dart
      title: 'Flutter JSON Demo - Emkafie',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const MyHomePage(),
```

**Soal 2**

Masukkan hasil capture layar ke laporan praktikum Anda.
![img](/img/W13_1.png)


**Soal 3**

Masukkan hasil capture layar ke laporan praktikum Anda.

![img](/img/W13_2.png)
![img](/img/W13_3.png)

## Praktikum 2
**Soal 4**

Capture hasil running aplikasi Anda, kemudian impor ke laporan praktikum Anda!

![img](/img/W13_4.png)
![img](/img/W13_5.png)

## Praktikum 3
**Soal 5**

Jelaskan maksud kode lebih safe dan maintainable!

Mencegah Typo (Kesalahan Ketik) - Safety: Jika kita mengetik manual 'pizzaName' di banyak tempat (misalnya di fromJson, toJson, atau di file test), sangat mudah untuk tidak sengaja mengetik 'pizaName' atau 'PizzaName'

Kemudahan Refactoring (Perubahan) - Maintainability: Tanpa konstanta, kita harus mencari dan mengganti ("Find and Replace") teks 'pizzaName' di seluruh file satu per satu, yang berisiko ada yang terlewat. Dengan konstanta, kita cukup mengganti nilai di satu tempat saja: const String keyName = 'name'; Maka seluruh bagian kode yang menggunakan keyName akan otomatis menggunakan nilai baru tersebut.

Capture hasil praktikum Anda dan lampirkan di README.

![img](/img/W13_6.png)

## Praktikum 4
**Soal 6**

Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

![img](/img/W13-8.gif)

## Praktikum 5
**Soal 7**

Capture hasil praktikum Anda dan lampirkan di README.

![img](/img/W13_9.png)

## Praktikum 6
**Soal 8**

Jelaskan maksud kode pada langkah 3 dan 7 !

`writeFile`: Kode ini bertujuan untuk menulis (menyimpan) data string ke dalam file secara asinkron.

`await myFile.writeAsString(...)`: Perintah ini membuka file yang dituju oleh variabel myFile (yang path-nya sudah diatur di initState) dan menuliskan teks (Nama dan NIM) ke dalamnya

Run & Tampilan: Pada langkah ini, ketika tombol 'Read File' ditekan, aplikasi memanggil method `readFile()`.

myFile.readAsString() akan membaca isi file yang sebelumnya ditulis (pada langkah initState -> writeFile).

Setelah data berhasil dibaca, setState dipanggil untuk memperbarui variabel fileText.

Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

![img](/img/W13-10.gif)

## Praktikum 7
**Soal 9**

![img](/img/W13-11.gif)
