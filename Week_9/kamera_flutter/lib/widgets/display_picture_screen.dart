import 'dart:io'; // Penting: Diperlukan untuk kelas 'File'
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

// Langkah 7: Membuat widget baru DisplayPictureScreen
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture - NIM Anda')),
      // Tampilkan gambar dari file di path yang diberikan
      body: kIsWeb
        ? Image.network(imagePath)  // Gunakan Image.network untuk Web
        : Image.file(File(imagePath)),
    );
  }
}