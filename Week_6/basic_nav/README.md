## Farrel Muchammad Kafie
## 2341720176

# Basic_navigation

# Praktikum 1
## Setup HomePage

```dart
class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000),
    Item(name: 'Salt', price: 2000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(8),
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: Card(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(child: Text(item.name)),
                      Expanded(
                        child: Text(
                          item.price.toString(),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

```
* Deklarasi kelas 
* HomePage adalah StatelessWidget, tidak punya state yang berubah.
Field items

* List item statis berisi dua objek Item (nama & harga).
Method build

* Menghasilkan tampilan widget berdasarkan context.
Scaffold

* Struktur dasar halaman Material, hanya memakai body.
Container

* Memberi margin luar pada list.
ListView.builder

* Membuat daftar item secara efisien, sesuai jumlah item.
Ambil item

* Mengakses item berdasarkan index.
InkWell

* Deteksi tap, navigasi ke '/item' dengan argument item.
Card & Container

* Tampilan tiap item dengan margin dan gaya Card.
Row & Expanded

* Dua kolom: nama dan harga, masing-masing pakai Expanded.
Navigasi & arguments

* Data item dikirim ke halaman tujuan lewat arguments.
Catatan harga

* Harga ditampilkan tanpa format mata uang.
Peningkatan opsional

* Gunakan ListTile, format harga, handle list kosong, buat items immutable.
Edge case

* Tampilkan placeholder jika list kosong, cek null arguments di halaman tujuan.

```dart
void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {'/': (context) => HomePage(), '/item': (context) => ItemPage()},
    ),
  );
}
```

> Fungsi main() adalah entry point aplikasi Flutter.
runApp() menjalankan aplikasi dengan widget root.
MaterialApp adalah widget utama yang mengatur navigasi dan tema.
initialRoute: '/' menentukan halaman awal adalah HomePage.
routes berisi peta route:
'/' → HomePage()
'/item' → ItemPage()
Navigasi antar halaman dilakukan dengan nama route.

![imgOutput](/images/cdlb6-1.gif)

## Tugas Praktikum 2

![Tampilan GridView dan Footer](/images/cdlb6-2.gif)

Tampilan utama aplikasi kini menggunakan `GridView` untuk layout seperti marketplace dan memiliki footer yang berisi identitas.


**Animasi Hero Widget**
Saat gambar produk diklik, gambar tersebut akan "terbang" ke halaman detail, memberikan transisi yang mulus.

**Halaman Detail Produk**
Halaman detail menampilkan semua informasi produk yang diterima dari halaman utama.

---

## Penjelasan Implementasi

### Implementasi Hero Widget
`Hero` widget digunakan untuk menciptakan animasi transisi antar halaman. Kuncinya adalah membungkus widget (dalam kasus ini, `Image.asset`) di halaman sumber dan tujuan dengan `Hero` widget yang memiliki **`tag` yang sama dan unik**.

**Kode di `home_page.dart` (Sumber):**
```dart
// ...
Hero(
  tag: 'productImage_${item.name}', // Tag unik berdasarkan nama item
  child: Image.asset(
    item.photoAsset,
    //...
  ),
),
// ...
```

**Kode di `item_page.dart` (Tujuan):**
```dart
// ...
Hero(
  tag: 'productImage_${item.name}', // Tag yang sama persis
  child: ClipRRect(
    // ...
    child: Image.asset(item.photoAsset),
  ),
),
// ...
```

### Refactoring Widget
Untuk membuat kode lebih bersih dan mudah dikelola, widget `Card` untuk setiap produk dipecah menjadi widget `StatelessWidget` tersendiri yang bernama `ProductCard`. Footer juga dibuat sebagai widget `Footer` yang terpisah.

**Struktur di `HomePage` menjadi lebih sederhana:**
```dart
GridView.builder(
  // ...
  itemBuilder: (context, index) {
    // Memanggil widget yang sudah di-refactor
    return ProductCard(item: items[index]);
  },
),
const Footer(),
```

### Migrasi ke `go_router`
Navigasi `Navigator.pushNamed` diubah menggunakan package `go_router` untuk manajemen rute yang lebih terpusat dan modern.

**Konfigurasi Rute di `main.dart`:**
Semua rute aplikasi didefinisikan di satu tempat. Untuk mengirim data, kita menggunakan parameter `extra`.

```dart
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/item',
      builder: (context, state) {
        // Ambil data dari parameter 'extra'
        final Item item = state.extra as Item;
        return ItemPage(item: item);
      },
    ),
  ],
);

// MaterialApp diubah menjadi MaterialApp.router
MaterialApp.router(
  routerConfig: _router,
);
```

**b. Pemanggilan Rute:**
Navigasi kini dipanggil menggunakan `context.push` atau `context.go`.

```dart
// Di dalam ProductCard
onTap: () {
  context.push('/item', extra: item);
},
```

---