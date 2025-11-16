# Laporan Praktikum Pemrogramman Mobile

| Nama | NIM | Kelas |
|---|---|---|
| Farrel Muchammad Kafie | 2341720176 | TI-3H |

* **Soal 13**

1. Jelaskan maksud praktikum ini!

Maksud praktikum ini adalah untuk mengenalkan pola arsitektur BLoC (Business Logic Component).

Tujuan utamanya adalah memisahkan logika bisnis (otak) dari kode tampilan (UI).

UI (random_screen.dart): Bertanggung jawab hanya untuk menampilkan widget (tombol, teks) dan memberi tahu BLoC jika ada sesuatu yang terjadi (tombol ditekan). UI tidak tahu cara membuat angka acak.

BLoC (random_bloc.dart): Bertanggung jawab hanya untuk "berpikir". Ia menerima perintah dari UI ("buat angka baru!"), melakukan pekerjaannya (membuat angka acak), dan mengirimkan hasil barunya kembali ke UI.

Pemisahan ini membuat kode lebih bersih, lebih mudah diuji (testable), dan lebih mudah dikelola saat aplikasi Anda tumbuh lebih besar.

2. Dimanakah letak konsep pola BLoC-nya?

    UI (FloatingActionButton) mengirim event ke Input BLoC (Sink).

    BLoC memproses event (membuat angka acak).

    BLoC mengirim hasil ke Output BLoC (Stream).

    UI (StreamBuilder) mendengarkan Output BLoC dan otomatis update tampilan.

![img](/img/W12-8.gif)