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

      // Langkah 6 & 9: Mengambil gambar dan menampilkannya
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Langkah 6: Menggunakan try/catch
          try {
            // Pastikan kamera sudah terinisialisasi
            await _initializeControllerFuture;

            // Ambil gambar
            final image = await _controller.takePicture();

            if (!context.mounted) return;

            // Langkah 9: Navigasi ke DisplayPictureScreen
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
