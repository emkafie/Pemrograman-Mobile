# Laporan Praktikum Pemrogramman Mobile

| Nama | NIM | Kelas |
|---|---|---|
| Farrel Muchammad Kafie | 2341720176 | TI-3H |


## Praktikum 1 - Dart Streams

* **Soal 1**

Tugas: Tambahkan nama panggilan pada title app dan ganti warna tema aplikasi.

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 1. Title diubah
      title: 'Stream - [Emkafie]',
      theme: ThemeData(
        // 2. Warna tema diubah (contoh: Colors.teal)
        primarySwatch: Colors.teal,
      ),
      home: const StreamHomePage(),
    );
  }
}

// ...

class _StreamHomePageState extends State<StreamHomePage> {
  // ...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 1. Title di AppBar juga diubah
        title: const Text('Stream - [Emkafie]'),
      ),
      body: Container(
        decoration: BoxDecoration(color: bgColor),
      ),
    );
  }
}
```
* **Soal 2**

Tugas: Tambahkan 5 warna lainnya pada variabel colors.

```dart
class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    // Tambahan 5 warna:
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.pink,
    Colors.indigo,
  ];
```
* **Soal 3**

1. Jelaskan fungsi keyword yield* pada kode tersebut!

    Keyword yield* (yield-star) digunakan untuk mendelegasikan atau "meneruskan" semua event dari satu Stream ke Stream lain. Dalam kasus ini, fungsi getColors() (sebuah async* Stream) menggunakan yield* untuk mengambil seluruh output dari Stream.periodic(...) dan memancarkannya seolah-olah event tersebut berasal dari getColors() itu sendiri.

2. Apa maksud isi perintah kode tersebut?

    Kode tersebut membuat sebuah Stream yang secara otomatis memancarkan warna berikutnya dari list colors setiap satu detik, secara berulang-ulang

* **Soal 4**

![img](/img/W12-1.gif)

* **Soal 5**

Jelaskan perbedaan menggunakan listen dan await for!

* await for (Pull-based (Menarik))

    Memperlakukan Stream seperti perulangan (loop). Kode akan menjeda (await) dan menunggu data berikutnya dari Stream sebelum melanjutkan eksekusi loop.

* .listen() (Push-based (Mendorong))

    Berlangganan (subscribe) ke Stream. Kode akan langsung lanjut dieksekusi, dan sebuah callback function akan dipanggil secara otomatis setiap kali Stream "mendorong" (push) data baru.

## Praktikum 2 - Stream controllers dan sinks

* **Soal 6**

1. Jelaskan maksud kode langkah 8 dan 10 tersebut!

Langkah 8 (initState): Kode ini adalah "pemasang pipa" atau "penyiapan pendengar".

    numberStream = NumberStream();: Membuat objek dari class NumberStream yang kita buat di stream.dart.

    numberStreamController = numberStream.controller;: Mengambil StreamController yang ada di dalam objek numberStream.

    Stream stream = numberStreamController.stream;: Mengambil "ujung keluaran" (output) dari controller. StreamController memiliki dua sisi: sink (input) dan stream (output).

    stream.listen(...);: Ini adalah bagian terpentING. Kita berlangganan (subscribe) ke stream. Kita bilang, "Hei stream, setiap kali (listen) ada data baru (event) yang keluar dari kamu, jalankan kode di dalam kurung kurawal ini."

    setState(() { lastNumber = event; });: Kode yang dijalankan setiap ada data baru. setState memberi tahu Flutter untuk membangun ulang UI dan memperbarui Text widget dengan event (angka baru) yang diterima.

Langkah 10 (addRandomNumber): Kode ini adalah "pemicu" atau "pengirim data".

    Random random = Random(); int myNum = random.nextInt(10);: Ini hanya untuk membuat angka acak baru antara 0 dan 9.

    numberStream.addNumberToSink(myNum);: Ini adalah bagian kuncinya. Kita memanggil method yang kita buat di stream.dart, yang isinya adalah controller.sink.add(myNum). Ini mendorong (push) angka acak (myNum) ke dalam sink (input) dari StreamController.

![img](/img/W12-3.gif)

* **Soal 6**

Jelaskan maksud kode langkah 13 sampai 15 tersebut!

Ketiga langkah ini bertujuan untuk mendemonstrasikan penanganan error (error handling) dalam sebuah Stream.

    Langkah 13 (addError() di stream.dart): Sama seperti controller.sink.add(data) yang digunakan untuk menambahkan data ke stream, controller.sink.addError('error') digunakan untuk menambahkan sebuah event error ke stream. Ini adalah cara kita memberi tahu "pelanggan" (listener) bahwa sesuatu yang salah telah terjadi.

    Langkah 14 (onError di main.dart): Kita memodifikasi stream.listen(). Method listen tidak hanya menerima satu fungsi (untuk data), tapi juga bisa menerima parameter bernama onError. stream.listen((event) { ... }, onError: (error) { ... }); Blok onError adalah callback khusus yang hanya akan dieksekusi jika stream menerima event error (yang dikirim oleh Langkah 13), bukan event data biasa. Di sini kita mengaturnya untuk mengubah lastNumber menjadi -1 agar terlihat di UI bahwa telah terjadi error.

    Langkah 15 (Edit addRandomNumber() di main.dart): Langkah ini adalah untuk menguji penanganan error kita. Kita mengganti kode yang tadinya mengirim data (addNumberToSink) menjadi kode yang mengirim error (addError). Sekarang, ketika tombol "New Random Number" ditekan, ia tidak lagi mengirim angka, melainkan mengirim error. Ini akan memicu callback onError (dari Langkah 14), dan UI akan menampilkan angka -1.

## Praktikum 3 - Injeksi data ke streams

* **Soal 8**

1. Jelaskan maksud kode langkah 1-3 tersebut!

    Langkah 1 (late StreamTransformer transformer;): Ini adalah deklarasi variabel. Kita memberi tahu Dart bahwa kita akan memiliki variabel bernama transformer yang bertipe StreamTransformer.

    Langkah 2 (StreamTransformer): Ini adalah "mesin"-nya. Kita mengaturnya untuk melakukan 2 hal:

        handleData: Jika ada data (angka) masuk (misal: 7), ubah data itu (misal: 7 * 10 = 70).

        handleError: Jika ada error masuk, ubah error itu jadi angka -1.

    Langkah 3 (stream.transform(...)): Ini adalah perintah untuk memasang mesin tadi ke aliran data.

singkatnya mencegat angka acak (0-9) sebelum ditampilkan, mengalikannya dengan 10, lalu baru menampilkannya. Itu sebabnya hasilnya menjadi 0, 10, 20, dst.

![img](/img/W12-4.gif)

## Praktikum 4 - Subscribe ke stream events

* **Soal 9**

Jelaskan maksud kode langkah 2, 6 dan 8 tersebut!

Langkah 2 (initState):

    Maksud: subscription = stream.listen(...)

    Penjelasan: Kode ini "berlangganan" (subscribe) ke stream. Bagian terpentingnya adalah kita menyimpan "bukti berlangganan" ini ke dalam variabel subscription.

Langkah 6 (dispose):

Maksud: subscription.cancel();

    Penjelasan: Method dispose() dipanggil oleh Flutter saat widget akan dihancurkan (misal: pindah halaman). Perintah subscription.cancel() menggunakan "nomor pelanggan" (dari Langkah 2) untuk berhenti berlangganan secara resmi.

Langkah 8 (addRandomNumber):

Maksud: if (!numberStreamController.isClosed) { ... }

    Penjelasan: Ini adalah pengecekan keamanan. Saat menekan tombol "Stop Subscription" (Langkah 5 & 7), itu memanggil numberStreamController.close().

    Kode ini mengecek: "Apakah controller-nya sudah ditutup?"

    Jika TIDAK (!isClosed): Aman, kirim angka baru (addNumberToSink).

    Jika YA (else): Jangan kirim angka (karena akan error), tapi tampilkan -1 untuk memberi tahu pengguna bahwa stream sudah berhenti.

![img](/img/W12-5.gif)
![img](/img/W12-5-1.png)

## Praktikum 5 - Multiple stream subscriptions

* **Soal 10**

Jelaskan mengapa error itu bisa terjadi ?

    Error Bad state: Stream has already been listened to terjadi karena:

    Secara default, Stream yang dibuat dari StreamController adalah "Single Subscription" (langganan tunggal).

    Artinya: Stream tersebut hanya boleh memiliki satu listener (pendengar) saja sepanjang masa aktifnya.

* **Soal 11**

Jelaskan mengapa hal itu bisa terjadi (angka duplikat)?

    Ini terjadi karena telah mengubah Stream menjadi Broadcast Stream dan memiliki dua listener yang aktif.

    Perbaikan (.asBroadcastStream()): Perintah ini mengubah "Single Subscription" (DVD) menjadi "Broadcast Stream" (Siaran TV). Sekarang, banyak listener bisa mendengarkan channel yang sama.

![immg](/img/W12_6-1.png)

Penyebab Duplikat:

    2 listener yang mendengarkan stream yang sama: subscription dan subscription2.

    Saat menekan tombol, addRandomNumber() mengirim satu angka (misal: 7) ke stream.

    Stream (Siaran TV) ini memancarkan angka 7 ke semua listener-nya.

    subscription menerima 7 -> memanggil setState -> values ditambah "7 - ".

    subscription2 juga menerima 7 -> memanggil setState -> values ditambah "7 - ".

    Hasilnya, untuk setiap satu angka, UI diperbarui dua kali, sehingga teksnya menjadi "7 - 7 - ...".

![img](/img/W12-6.gif)