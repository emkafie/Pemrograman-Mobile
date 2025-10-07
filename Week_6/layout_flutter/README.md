## Farrel Muchammad Kafie
## 2341720176

# layout_flutter

# Praktikum 1


### main.dart ganti dengan template
![img](/images/01-3.png)

### Implementasi title row
![img](/images/01-4.png)

> Letakkan widget Column di dalam widget Expanded agar menyesuaikan ruang yang tersisa di dalam widget Row. Tambahkan properti crossAxisAlignment ke CrossAxisAlignment.start sehingga posisi kolom berada di awal baris.

> Letakkan baris pertama teks di dalam Container sehingga memungkinkan Anda untuk menambahkan padding = 8. Teks ‘Batu, Malang, Indonesia' di dalam Column, set warna menjadi abu-abu.

> Dua item terakhir di baris judul adalah ikon bintang, set dengan warna merah, dan teks "41". Seluruh baris ada di dalam Container dan beri padding di sepanjang setiap tepinya sebesar 32 piksel. Kemudian ganti isi body text ‘Hello World' dengan variabel titleSection

# Praktikum 2
### column method _buildButtonColumn
![img](/images/01-5.png)

> Membuat tombol dengan ikon dan label. Fungsi ini mengembalikan widget Column yang berisi ikon di atas dan teks label di bawahnya, dengan jarak atas pada label. Warna ikon dan label mengikuti parameter color yang diberikan.

### widget buttonSection
![img](/images/01-6.png)

> Membuat tiga tombol (CALL, ROUTE, SHARE) dalam satu baris yang tersebar rata menggunakan Row dan MainAxisAlignment.spaceEvenly. Setiap tombol dibuat dengan fungsi _buildButtonColumn.

# Praktikum 3
### widget text section
![img](/images/01-7.png)

> Membuat widget teks berisi deskripsi Danau Ranu Regulo, dengan padding di sekelilingnya dan fitur pembungkus baris otomatis (softWrap: true).

# Praktikum 4
### implementasi gambar
![img](/images/01-8.png)

### Tambahkan semua aset ke Body,
```
    return MaterialApp(
      title: 'Farrel Muchammad Kafie - 2341720176',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Farrel Muchammad Kafie - 2341720176'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );

```

> Menampilkan gambar lake.jpg dari folder images di dalam aplikasi Flutter, dengan lebar 600, tinggi 240, dan gambar memenuhi area menggunakan BoxFit.cover. Gambar ini menjadi bagian dari daftar tampilan (ListView).

![img](/images/01-9.png)


## Tugas 1

> Pada tugas layouting ini saya menambahkan image row untuk menampilkan image dengan menerapkan Sizing Widget, dan footer 
```
    Widget imageRow = Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Image.asset('images/lake2.jpg')),
          Expanded(flex: 2, child: Image.asset('images/lake3.jpg')),
          Expanded(child: Image.asset('images/lake4.jpg')),
        ],
      ),
    );

    Widget footer = Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[200],
      alignment: Alignment.center,
      child: const Text(
        '© 2025 Farrel Muchammad Kafie',
        style: TextStyle(fontSize: 14, color: Colors.black54),
      ),
    );
```
> imageRow menampilkan tiga gambar dalam satu baris dengan padding di sisi kiri, kanan, dan bawah. Gambar tengah lebih besar (flex: 2).
footer membuat bagian bawah aplikasi berisi teks copyright, dengan padding dan latar warna abu-abu muda, rata tengah.

![img](/images/tugas-1.png)
