# Laporan Praktikum 1: Mengambil Foto dengan Kamera di Flutter

## Nama: Farrel Muchammad Kafie
## NIM: 2341720176

### Langkah 1: Buat Project Baru
---
### Langkah 2: Tambah Dependensi yang Diperlukan
Dependensi camera, path_provider, dan path telah ditambahkan ke file pubspec.yaml.

Selain itu, minSdkVersion pada file android/app/build.gradle telah diubah menjadi 21.

---
### Langkah 3: Ambil Sensor Kamera dari device
Fungsi main pada lib/main.dart telah diubah menjadi async dan kode untuk inisialisasi binding serta pengambilan daftar kamera telah ditambahkan.

```dart
Future<void> main() async {
  // Pastikan plugin terinisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  // Ambil daftar kamera yang tersedia
  final cameras = await availableCameras();

  // Ambil kamera pertama dari daftar (biasanya kamera belakang)
  final firstCamera = cameras.first;
```
### Langkah 4: Buat dan Inisialisasi CameraController

```dart
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// Import file DisplayPictureScreen yang akan kita buat
import 'display_picture_screen.dart';

// Langkah 4: Membuat StatefulWidget
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({super.key, required this.camera});

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Langkah 4: Membuat dan inisialisasi CameraController
    _controller = CameraController(widget.camera, ResolutionPreset.medium);

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Langkah 4: Hapus controller saat widget di-dispose
    _controller.dispose();
    super.dispose();
  }
```

### Langkah 5: Gunakan CameraPreview untuk Menampilkan Preview Foto

```dart
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture - 2341720176')),

      // Langkah 5: Menampilkan preview kamera menggunakan FutureBuilder
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Jika Future selesai, tampilkan preview
            return CameraPreview(_controller);
          } else {
            // Jika masih loading, tampilkan spinner
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
```

### Langkah 6: Ambil Foto dengan CameraController

# Laporan Praktikum 1: Mengambil Foto dengan Kamera di Flutter

## Nama: Farrel Muchammad Kafie
## NIM: 2341720176

### Langkah 1: Buat Project Baru
---
### Langkah 2: Tambah Dependensi yang Diperlukan
Dependensi camera, path_provider, dan path telah ditambahkan ke file pubspec.yaml.

Selain itu, minSdkVersion pada file android/app/build.gradle telah diubah menjadi 21.

---
### Langkah 3: Ambil Sensor Kamera dari device
Fungsi main pada lib/main.dart telah diubah menjadi async dan kode untuk inisialisasi binding serta pengambilan daftar kamera telah ditambahkan.

```dart
Future<void> main() async {
  // Pastikan plugin terinisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  // Ambil daftar kamera yang tersedia
  final cameras = await availableCameras();

  // Ambil kamera pertama dari daftar (biasanya kamera belakang)
  final firstCamera = cameras.first;
```
### Langkah 4: Buat dan Inisialisasi CameraController

```dart
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// Import file DisplayPictureScreen yang akan kita buat
import 'display_picture_screen.dart';

// Langkah 4: Membuat StatefulWidget
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({super.key, required this.camera});

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Langkah 4: Membuat dan inisialisasi CameraController
    _controller = CameraController(widget.camera, ResolutionPreset.medium);

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Langkah 4: Hapus controller saat widget di-dispose
    _controller.dispose();
    super.dispose();
  }
```

### Langkah 5: Gunakan CameraPreview untuk Menampilkan Preview Foto

```dart
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture - 2341720176')),

      // Langkah 5: Menampilkan preview kamera menggunakan FutureBuilder
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Jika Future selesai, tampilkan preview
            return CameraPreview(_controller);
          } else {
            // Jika masih loading, tampilkan spinner
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
```

### Langkah 6: Ambil Foto dengan CameraController

```dart
floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Langkah 6: Menggunakan try/catch
          try {
            // Pastikan kamera sudah terinisialisasi
            await _initializeControllerFuture;

            // Ambil gambar
            final image = await _controller.takePicture();

            if (!context.mounted) return;
```

### Langkah 7: Buat Widget Baru DisplayPictureScreen

```dart
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture - NIM Anda')),
      // Tampilkan gambar dari file di path yang diberikan
      body: Image.file(File(imagePath)),
    );
  }
}
```

### Langkah 8: Edit main.dart

```dart
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        // Teruskan kamera yang didapat ke widget TakePictureScreen
        camera: firstCamera,
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
```

### Langkah 9: Menampilkan Hasil Foto

```dart
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    DisplayPictureScreen(imagePath: image.path),
              ),
            );
          } catch (e) {
            // Jika ada error, log ke console
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
```
---
## OUTPUT
![Output_GIF](/img/cdlb9-1(1).gif)

---

## Praktikum 2: Photo Filter Carousel

Berikut ringkasan langkah yang harus dilakukan untuk membuat fitur Photo Filter Carousel (gabungkan ke praktikum sebelumnya):

### Langkah 1: Buat project baru
Buatlah project Flutter baru untuk pertemuan 09 dengan nama `photo_filter_carousel` atau tambahkan file berikut ke workspace yang sudah ada:

```powershell
flutter create photo_filter_carousel
cd photo_filter_carousel
```

### Langkah 2: Buat widget Selector (ring) dan dark gradient
Buat folder `lib/widgets` dan file `filter_selector.dart`. Widget ini berisi:
- Carousel thumbnail (Flow / Page-like)
- Gradient gelap di atas foto
- Selection ring di tengah (dapat menerima callback `onCenterTap` untuk aksi capture)

Widget harus menerima:
- `List<Color> filters`
- `void Function(Color) onFilterChanged`
- `VoidCallback? onCenterTap` (opsional)

Contoh file: `lib/widgets/filter_selector.dart` (lihat file di repository untuk implementasi lengkap).

### Langkah 3: Buat widget PhotoFilterCarousel
Buat file `lib/widgets/filter_carousel.dart`. Widget ini menggabungkan background (foto atau preview kamera) dengan `FilterSelector` di bagian bawah, serta `ValueNotifier<Color>` untuk menyimpan filter aktif. Terapkan overlay warna menggunakan `ColorFiltered`.

### Langkah 4: Buat thumbnail filter (FilterItem)
Buat file `lib/widgets/filter_item.dart` yang menampilkan thumbnail circular. Terapkan warna dengan `color` dan `colorBlendMode`. Tambahkan `errorBuilder` pada `Image.network` untuk fallback saat gambar tidak tersedia.

### Langkah 5: Siapkan daftar filter
Di `filter_carousel.dart` buat daftar warna filter, misalnya:

```dart
final filters = [
  Colors.white,
  ...List.generate(
    Colors.primaries.length,
    (i) => Colors.primaries[(i * 4) % Colors.primaries.length],
  ),
];
```

Kirim daftar ini ke `FilterSelector`.

### Langkah 6: Implementasi di `main.dart` (atau HomeScreen)
Impor `PhotoFilterCarousel` di `lib/main.dart` atau buat `HomeScreen` yang memberi opsi membuka Camera atau Carousel. Jika ingin mendukung kamera, panggil `availableCameras()` sebelum menavigasi ke layar kamera.

Contoh minimal `main.dart`:

```dart
import 'package:flutter/material.dart';
import 'widgets/filter_carousel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const PhotoFilterCarousel(),
    );
  }
}
```
---
## OUTPUT
![Output_GIF](/img/cdlb9-1(2)-2%20(1).gif)

---
# TUGAS PRAKTIKUM

Gabungkan hasil praktikum 1 dengan hasil praktikum 2 sehingga setelah melakukan pengambilan foto, dapat dibuat filter carouselnya!

Output Hasil Gabungan
![Output_GIF](/img/output-filter%20(1).gif)

Jelaskan maksud void async pada praktikum 1?

* async menandakan fungsi berisi operasi asynchronous sehingga Anda bisa memakai await di dalamnya.
* Future<void> berarti fungsi mengembalikan sebuah Future yang tidak menghasilkan nilai (void). Karena fungsi async selalu mengembalikan Future, deklarasi tipe Future disarankan.
* Kenapa perlu di main() di praktikum? kamera harus memanggil API asynchronous seperti availableCameras() yang mengembalikan Future<List<CameraDescription>>. Untuk menunggu hasilnya dengan await, fungsi pemanggil harus diberi async.

Jelaskan fungsi dari anotasi @immutable dan @override ?

**Immutable**
* Menandai bahwa kelas seharusnya bersifat immutable (tidak berubah setelah dibuat). Praktisnya:
Semua bidang (fields) sebaiknya final.
Analyzer akan memberi peringatan jika ada field non-final pada kelas yang dianotasi @immutable.

**Override** 
* Menyatakan bahwa method/field saat ini dimaksudkan untuk menimpa (override) anggota pada superclass atau interface. Selalu pakai @override saat menimpa method (build, initState, dispose, dll.) — ini adalah konvensi terbaik.