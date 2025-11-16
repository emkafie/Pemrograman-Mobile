# Laporan Praktikum Pemrogramman Mobile

| Nama | NIM | Kelas |
|---|---|---|
| Farrel Muchammad Kafie | 2341720176 | TI-3H |

* **Soal 12**

1. Jelaskan maksud kode pada langkah 3!

Cara Kerja:

    Stream.periodic(const Duration(seconds: 1), ...): Ini adalah inti kodenya. Ini adalah stream yang otomatis memancarkan event baru setiap 1 detik.

    ... (int t) { ... return myNum; }: Setiap 1 detik, kode di dalam () dijalankan. Kode ini membuat angka acak (0-9) dan mengembalikannya (return myNum).

    yield*: Keyword ini "meneruskan" semua event (angka acak) yang dihasilkan oleh Stream.periodic keluar dari fungsi getNumbers().

Kesimpulan: Langkah 3 membuat sebuah stream yang secara otomatis menghasilkan angka acak baru setiap 1 detik.

2. Jelaskan maksud kode pada langkah 7!

    StreamBuilder adalah widget yang menghubungkan Stream langsung ke UI. Ia mendengarkan data baru dan otomatis membangun ulang Text widget setiap kali angka acak baru diterima dari stream. Kita tidak perlu lagi memanggil setState() secara manual.

![img](/img/W12-7.gif)