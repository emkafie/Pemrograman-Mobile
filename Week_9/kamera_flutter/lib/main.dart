import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// Import file TakePictureScreen yang akan kita buat
import 'widgets/take_picture_screen.dart'; 

// Langkah 3: Mengubah main() menjadi async dan mengambil list kamera
Future<void> main() async {
  // Pastikan plugin terinisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  // Ambil daftar kamera yang tersedia
  final cameras = await availableCameras();

  // Ambil kamera pertama dari daftar (biasanya kamera belakang)
  final firstCamera = cameras.first;

  // Langkah 8: Menjalankan aplikasi
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