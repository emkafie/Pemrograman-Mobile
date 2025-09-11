-- Soal 1 --

    Kode tersebut melakukan perulangan sebanyak 10 kali (i dari 0 sampai 9). Pada setiap iterasi, program mencetak kalimat: "Nama saya adalah Farrel, sekarang berumur X tahun", di mana X dimulai dari 20 dan berkurang 1 setiap iterasi (20, 19, 18, ..., 11). Jadi, output menunjukkan nama dan umur yang menurun dari 20 hingga 11.

-- Soal 2 --

Karena Flutter dibangun dengan menggunakan bahasa Dart. Semua logika aplikasi dan UI di Flutter ditulis dengan Dart. Akan lebih memudahkan dalam mencari dan memperbaiki error (debugging).

-- Soal 3 --

1. Dart adalah Fondasi, Flutter adalah Bangunannya 
    - Flutter dibangun sepenuhnya menggunakan Dart. Seluruh kode aplikasi mulai dari logika, tampilan (UI), hingga manajemen data akan ditulis dalam bahasa Dart.

2.  Dua Mode Kompilasi untuk Pengembangan Cepat dan Performa Maksimal
    - Just-In-Time (JIT): Digunakan selama proses pengembangan. Mode inilah yang memungkinkan adanya fitur fenomenal Hot Reload, di mana Anda bisa melihat perubahan kode secara instan tanpa me-restart aplikasi.
    - Ahead-Of-Time (AOT): Digunakan saat Anda merilis aplikasi (production). Kode dikompilasi langsung menjadi kode mesin native (ARM/x86), membuat aplikasi Flutter berjalan dengan sangat cepat dan memiliki performa yang opimal saat digunakan oleh pengguna.

3. Berbasis Object-Oriented Programming (OOP)
    - Segalanya di Flutter adalah Widget, dan setiap Widget pada dasarnya adalah sebuah Class dalam Dart. Pemahaman yang kuat tentang konsep OOP seperti class, object, inheritance, dan polymorphism akan sangat memudahkan Anda dalam membangun UI yang kompleks dan dapat digunakan kembali (reusable).

4. Sintaks yang Aman, Jelas, dan Modern
    - Statically Typed & Type-Safe: Dart memeriksa tipe data saat kompilasi, bukan saat aplikasi berjalan. Ini membantu Anda menemukan bug lebih awal
    - Operator yang Intuitif: Operator seperti == di Dart membandingkan isi (nilai) dari variabel, bukan alamat memorinya seperti di beberapa bahasa lain (misalnya Java).
    - Struktur Kode yang Jelas: Setiap aplikasi Dart memiliki titik masuk (entry point) yang jelas, yaitu fungsi main().


-- Soal 4 --

Penjelasan Null Safety dan Late Variable

Penjelasan Null Safety:
- Null safety mencegah error akibat variabel bernilai null.
- Tipe data tanpa '?' tidak boleh null.
- Tipe data dengan '?' boleh null.
- Operator '??' digunakan untuk memberikan nilai default jika null.
- Operator '!' digunakan untuk memastikan nilai tidak null (hati-hati jika salah bisa error).

Penjelasan Late Variable:
- Kata kunci 'late' digunakan untuk menunda inisialisasi variabel sampai variabel tersebut benar-benar dibutuhkan.
- Cocok digunakan jika nilai variabel belum diketahui saat deklarasi, tapi pasti akan diinisialisasi sebelum digunakan.
- Jika variabel late digunakan sebelum diinisialisasi, maka akan terjadi error 
(LateInitializationError).

Perbedaan Utama:
Definisi : 
| Fitur/Sistem keamanan bahasa untuk mencegah null error. | Keyword/Penanda untuk menunda inisialisasi variabel non-nullable.

Waktu Cek:
| Compile-time (saat kode dikompilasi). | Runtime (saat aplikasi berjalan dan variabel diakses).

Tujuan:
| Mencegah variabel memiliki nilai null secara tidak sengaja. | Mengizinkan variabel non-nullable tidak diinisialisasi saat deklarasi.