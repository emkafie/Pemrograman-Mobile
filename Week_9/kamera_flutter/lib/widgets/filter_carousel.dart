import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'filter_selector.dart';

@immutable
class PhotoFilterCarousel extends StatefulWidget {
  const PhotoFilterCarousel({super.key});

  @override
  State<PhotoFilterCarousel> createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  CameraDescription? _cameraDescription;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) return;

      // Prefer back camera if available
      final cam = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      _cameraDescription = cam;
      _controller = CameraController(cam, ResolutionPreset.medium, enableAudio: false);
      _initializeControllerFuture = _controller!.initialize();
      setState(() {});
    } catch (e) {
      // ignore errors for now; optionally surface to the UI
      // ignore: avoid_print
      print('Error initializing camera: $e');
    }
  }

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
            child: _buildPhotoWithFilter(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: _buildFilterSelector(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder(
      valueListenable: _filterColor,
      builder: (context, color, child) {
        // Jika kamera belum tersedia, tunjukkan placeholder
        if (_initializeControllerFuture == null) {
          return Container(color: Colors.black);
        }

        return FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done && _controller != null) {
              Widget preview = CameraPreview(_controller!);

              // Mirror preview hanya jika kamera depan
              if (_cameraDescription?.lensDirection == CameraLensDirection.front) {
                preview = Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                  child: preview,
                );
              }

              // Terapkan filter warna di atas preview kamera
              return ColorFiltered(
                colorFilter: ColorFilter.mode(color.withOpacity(0.5), BlendMode.color),
                child: SizedBox.expand(child: preview),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }

  Widget _buildFilterSelector() {
    return FilterSelector(
      onFilterChanged: _onFilterChanged,
      filters: _filters,
    );
  }
}