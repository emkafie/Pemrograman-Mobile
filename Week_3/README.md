-- Praktikum 1 --

Langkah 2 -> Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan!

    Output yang dihasilkan dari kode tersebut adalah test2, karena nilai String test = "test2"; dengan kodisi yang diberikan if test = test2 maka print "Test1"; else akan melakukan print "Something else". dan if diluar if-else sebelumnya akan menampilkan output "Test2 again" jika test = test2.

Langkah 3 -> Apakah terjadi error?

    Dalam Dart, ekspresi di dalam if harus berupa boolean (true/false). Variabel test2 bertipe String, sehingga tidak bisa langsung digunakan sebagai kondisi tanpa pembandingan.

-- Praktikum 2 --

Langkah 2 -> Apa yang terjadi? Jelaskan

    Variabel counter diinisialisasi dengan nilai 0.
    while (counter < 33): Selama counter kurang dari 33, program akan mencetak nilai counter dan menambahkannya satu per satu. Hasilnya, akan tercetak angka 0 sampai 32.
    Setelah keluar dari while, counter bernilai 33.

Langkah 3 -> Apa yang terjadi

        do { ... } while (counter < 77): Blok do-while ini akan mencetak nilai counter mulai dari 33, lalu menambahkannya satu per satu, hingga counter mencapai 77. Karena do-while selalu menjalankan blok minimal sekali, angka 33 sampai 76 akan dicetak.

-- Praktikum 3 --

Langkah 2 -> Apa yang terjadi? Jelaskan!

    Perulangan for dimulai dari i = 10 hingga i < 27 (jadi i dari 10 sampai 26).
    Setiap iterasi, i dicetak (print(i)).

Langkah 3 -> Apa yang terjadi?

    Jika i == 21, perulangan dihentikan dengan break.
    Untuk nilai i lain, kondisi else if (i > 1 || i < 7) selalu true (karena semua i >= 10 pasti lebih besar dari 1), sehingga:
    i dicetak lagi (jadi setiap i akan dicetak dua kali).
    continue membuat perulangan langsung lanjut ke iterasi berikutnya.

    "Logika else if (i > 1 || i < 7) tidak efektif, karena selalu true untuk i >= 10."

-- Tugas Praktikum --

    Variabel nama dan nim diisi dengan identitas nama dan NIM.
    Program melakukan perulangan dari i = 0 sampai 201.
    Untuk setiap nilai i, fungsi isPrime(i) dipanggil untuk mengecek apakah i adalah bilangan prima.
    Jika i adalah bilangan prima, maka program mencetak: nilai i, keterangan bahwa itu bilangan prima, serta nama dan NIM.
    Fungsi isPrime(n) akan:
    Mengembalikan false jika n < 2.
    Mengecek pembagi dari 2 sampai n ~/ 2. Jika ada pembagi yang habis, return false.
    Jika tidak ada pembagi, return true (berarti n adalah bilangan prima).
