// lib/widget/takepicture_screen.dart (LENGKAP DENGAN FUNGSI SWITCH)

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'display_picture_screen.dart';
import 'filter_selector.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    // Terima daftar kamera, bukan satu kamera
    required this.cameras,
  });

  // Ubah ini menjadi List
  final List<CameraDescription> cameras;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  // Variabel baru untuk melacak kamera mana yang aktif
  int _currentCameraIndex = 0;

  // Selected filter color for preview and passing to display screen
  Color _selectedFilter = Colors.white;

  @override
  void initState() {
    super.initState();
    // Inisialisasi kamera pertama (indeks ke-0)
    _initializeCamera(widget.cameras[_currentCameraIndex]);
  }

  // Fungsi baru untuk inisialisasi (atau re-inisialisasi) controller
  void _initializeCamera(CameraDescription cameraDescription) {
    _controller = CameraController(cameraDescription, ResolutionPreset.medium);

    // Set future baru
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Fungsi baru untuk mengganti kamera
  void _switchCamera() async {
    // Buang controller yang lama
    await _controller.dispose();

    // Ganti indeks kamera
    // % (modulo) akan membuatnya kembali ke 0 jika sudah di akhir daftar
    _currentCameraIndex = (_currentCameraIndex + 1) % widget.cameras.length;

    // Inisialisasi controller baru dengan kamera yang baru
    _initializeCamera(widget.cameras[_currentCameraIndex]);

    // Update UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a picture - 2341720176'),
        // TAMBAHKAN TOMBOL ACTION DI SINI
        actions: [
          IconButton(
            icon: const Icon(Icons.switch_camera),
            onPressed: () {
              // Panggil fungsi switch jika ada lebih dari 1 kamera
              _switchCamera();
            },
          ),
        ],
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Build preview (always mirrored like previous behaviour)
            Widget preview = Transform.scale(
              scaleX: -1.0,
              child: CameraPreview(_controller),
            );

            // Apply selected color filter overlay
            preview = ColorFiltered(
              colorFilter: ColorFilter.mode(
                _selectedFilter.withOpacity(0.5),
                BlendMode.color,
              ),
              child: SizedBox.expand(child: preview),
            );

            return Stack(
              children: [
                Positioned.fill(child: preview),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: FilterSelector(
                    filters: [
                      Colors.white,
                      ...List.generate(
                        Colors.primaries.length,
                        (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
                      ),
                    ],
                    onFilterChanged: (color) {
                      setState(() {
                        _selectedFilter = color;
                      });
                    },
                    onCenterTap: _capturePhoto,
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<void> _capturePhoto() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();

      if (!context.mounted) return;

      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            imagePath: image.path,
            filterColor: _selectedFilter,
          ),
        ),
      );
    } catch (e) {
      // ignore: avoid_print
      print('Error taking picture: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mengambil foto: $e')),
        );
      }
    }
  }
}
