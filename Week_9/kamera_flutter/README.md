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
