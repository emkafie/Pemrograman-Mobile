# Pemrograman Mobile - Week 4

### Nama : Farrel Muchammad Kafie
### NIM  : 2341720176

# Praktikum 1

## Langkah 1 - 2

![This is an alt text.](/Week_4/img/P1-L1-L2.png)

> Membuat list berisi [1, 2, 3].
Mengecek (assert) panjang list = 3 dan elemen ke-2 bernilai 2.
Mencetak panjang list dan elemen ke-2 (hasil: 3 dan 2).
Mengubah elemen ke-2 menjadi 1.
Mengecek (assert) elemen ke-2 sekarang bernilai 1.
Mencetak elemen ke-2 (hasil: 1).

## Langkah 3

![This is an alt text.](/Week_4/img/P1-L3.png)
 
 > Membuat list bertipe final dengan 5 elemen bertipeString? (nullable), semua diisi null secara default. Mengisi index ke-1 dengan nama, dan index ke-2 dengan NIM. Dilakukan perulangan untuk mengisi nilai null dengan iterasi (diisi dengan nilai data ke- sesuai index). Mencetak seluruh isi list.

 # Praktikum 2

 ## Langkah 1 - 2

![This is an alt text.](/Week_4/img/P2-L1-L2.png)

 > Membuat variabel halogens yang berisi set dari lima unsur halogen. Mencetak isi set halogens ke layar.

## Langkah 3

![This is an alt text.](/Week_4/img/P2-L1-L2.png)

> Membuat beberapa variabel Set. Elemen nama dan NIM ditambahkan ke Set menggunakan dua cara:
>> * .add() untuk menambah satu elemen. 
>> * .addAll() untuk menambah beberapa elemen sekaligus (dari koleksi seperti Set atau List).

# Praktikum 3

## Langkah 1 - 2

![This is an alt text.](/Week_4/img/P3-L1-L2.png)

> Kode ini membuat dua buah Map di Dart:
gifts: Map dengan key bertipe String dan value bisa String atau int. Contoh:
>> * 'first': 'partridge', 'fifth': 1.
nobleGases: Map dengan key bertipe int dan value bisa String atau int.
>> * 'helium', 18: 2.
Kedua Map tersebut kemudian dicetak ke layar menggunakan print.

![This is an alt text.](/Week_4/img/P3-L3(1).png)
![This is an alt text.](/Week_4/img/P3-L3(2).png)

> Terdapat empat variabel Map:
>> * gifts: Map dengan key String dan value String, berisi hadiah dan juga ditambah nama serta NIM.
>> * nobleGases: Map dengan key int dan value String, berisi nama gas mulia, lalu ditambah nama dan NIM pada key 99 dan 100.
>> * mhs1: Map dengan key dan value String, diisi nama dan NIM.
>> * mhs2: Map dengan key int dan value String, diisi nama dan NIM.
> Semua Map dicetak ke layar.

# Praktikum 4

## Langkah 1 - 2


![This is an alt text.](/Week_4/img/P4-L1-L2.png)

> Membuat list bernama list berisi [1, 2, 3].
Membuat list baru list2 yang berisi angka 0 diikuti seluruh isi list (menggunakan spread operator ...), sehingga hasilnya [0, 1, 2, 3].
Mencetak isi list, list2, dan panjang list2 (hasilnya 4)

## Langkah 3

![This is an alt text.](/Week_4/img/P4-L3.png)

> Membuat list berisi [1, 2, null].
Membuat list2 dengan menambahkan 0 di depan dan seluruh isi list (hasil: [0, 1, 2, null]).
Membuat listNIM berisi NIM Anda.
Membuat listGabungan yang menggabungkan semua elemen dari list dan listNIM (hasil: [1, 2, null, 2341720176]).
Semua list dicetak ke layar.

## Langkah 4

![This is an alt text.](/Week_4/img/P4-L4.png)

>  Penggunaan spread operator dengan kondisi (if) pada list navTrue dan navFalse:
Jika promoActive true, navTrue berisi ['Home', 'Furniture', 'Outlet'].
Jika promoActive false, navFalse berisi ['Home', 'Furniture'].
"dead code" muncul karena baris if (promoActive) 'Outlet' di navFalse tidak akan pernah dijalankan saat promoActive bernilai false.

## Langkah 5

![This is an alt text.](/Week_4/img/P4-L5(1).png)

> Gambar dengan nilai login selain 'Manager'

![This is an alt text.](/Week_4/img/P4-L5(2).png)

> ika variabel login memiliki nilai selain "Manager" (misal "Staff" atau "Admin"), maka kondisi if (login case 'Manager') akan bernilai false, sehingga elemen 'Inventory' tidak akan ditambahkan ke dalam list nav3. Hasilnya, nav3 hanya berisi ['Home', 'Furniture', 'Plants'] tanpa 'Inventory'.

## Langkah 6

![This is an alt text.](/Week_4/img/P4-L6.png)

> Membuat listOfInts berisi [1, 2, 3].
Membuat listOfStrings yang berisi string '#0' diikuti hasil perulangan dari listOfInts, setiap elemen diubah menjadi string dengan format '#angka'. Hasilnya: ['#0', '#1', '#2', '#3'].
assert(listOfStrings[1] == '#1') memastikan elemen kedua adalah '#1'.
Mencetak listOfStrings ke layar.

# Praktikum 5

## Langkah 1 - 2

![This is an alt text.](/Week_4/img/P5-L1-L2.png)

> Membuat variabel record yang berisi tuple (record) dengan elemen positional ('first', 'last') dan named (a: 2, b: true).
print(record) akan mencetak isi tuple tersebut.

## Langkah 3

![This is an alt text.](/Week_4/img/P5-L3.png)

> Fungsi tukar() berada di luar main().
Di dalam main(), dibuat record angka = (10, 20), lalu dipanggil tukar(angka) untuk menukar nilainya.
Output akan menunjukkan nilai sebelum dan sesudah pertukaran.

## Langkah 4

![This is an alt text.](/Week_4/img/P5-L4.png)

> Baris (String, int) mahasiswa; mendeklarasikan variabel mahasiswa dengan tipe record (tuple) yang berisi String dan int.
mahasiswa = ('Farrel Muchammad Kafie', 2341720176); mengisi record tersebut dengan nama dan NIM 

## Langkah 5

![This is an alt text.](/Week_4/img/P5-L4.png)

> Variabel mahasiswa2 adalah record (tuple) yang berisi elemen positional ('first', 'last') dan named (a: 2, b: true).
Untuk mengakses elemen positional, digunakan mahasiswa2.$1 (hasil: 'first') dan mahasiswa2.$2 (hasil: 'last').
Untuk mengakses elemen named, digunakan mahasiswa2.a (hasil: 2) dan mahasiswa2.b (hasil: true).

# TUGAS PRAKTIKUM

1. Dokumentasi Praktikum

2. Functions dalam bahasa Dart
> Function adalah blok kode yang dapat dipanggil berulang kali untuk menjalankan tugas tertentu. Function bisa menerima parameter dan mengembalikan nilai.

3. Jenis-jenis parameter di Functions
* Positional Parameter: Parameter berdasarkan urutan.
```
void sapa(String nama, int umur) {
  print('Halo $nama, umur $umur');
}
```
* Optional Positional Parameter: Parameter opsional, ditulis dalam [].
```
void sapa(String nama, [int? umur]) {
  print('Halo $nama, umur $umur');
}
```
* Named Parameter: Parameter dengan nama, ditulis dalam { }.
```
void sapa({required String nama, int umur = 0}) {
  print('Halo $nama, umur $umur');
}
```

4. Functions sebagai first-class objects

> Artinya, function dapat disimpan dalam variabel, dikirim sebagai parameter, atau dikembalikan dari function lain.

```
void cetak(String pesan) {
  print(pesan);
}

void main() {
  var f = cetak;
  f('Hello Dart!');
}
```

5. Anonymous Functions

> Anonymous function adalah function tanpa nama, sering digunakan sebagai argument atau callback.
```
var list = [1, 2, 3];
list.forEach((item) {
  print(item);
});
```

6. Perbedaan Lexical scope dan Lexical closures
* Lexical Scope: Ruang lingkup variabel ditentukan oleh posisi kode saat ditulis.
```
void main() {
  var a = 10;
  void tampil() {
    print(a); // a bisa diakses karena lexical scope
  }
  tampil();
}
```
* Lexical Closures: Function yang “membawa” lingkungan variabel di sekitarnya saat didefinisikan.
```
Function buatPenambah(int nilai) {
  return (int x) => x + nilai;
}
var tambahLima = buatPenambah(5);
print(tambahLima(3)); // Output: 8
```

7. Return multiple value di Functions
Gunakan record (tuple) atau Map.
* Contoh dengan record:
```
(String, int) getData() {
  return ('Farrel', 20);
}

void main() {
  var data = getData();
  print(data.$1); // 'Farrel'
  print(data.$2); // 20
}
```

* Contoh dengan Map:
```
Map<String, dynamic> getData() {
  return {'nama': 'Farrel', 'umur': 20};
}
```