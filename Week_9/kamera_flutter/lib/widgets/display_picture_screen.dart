import 'dart:io'; // Penting: Diperlukan untuk kelas 'File'
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

// Langkah 7: Membuat widget baru DisplayPictureScreen
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final Color filterColor;

  const DisplayPictureScreen({
    super.key,
    required this.imagePath,
    this.filterColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture - 2341720176')),
      // Tampilkan gambar dari file di path yang diberikan
      body: Center(
        // Gunakan Transform.scale untuk membalik widget
        child: Transform.scale(
          scaleX:
              -1, // Nilai -1 pada scaleX akan membalik widget secara horizontal
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              filterColor.withOpacity(0.5),
              BlendMode.color,
            ),
            child: kIsWeb
                ? Image.network(imagePath) // Gunakan Image.network untuk Web
                : Image.file(
                    File(imagePath),
                  ), // Gunakan Image.file untuk native
          ),
        ),
      ),
    );
  }
}
