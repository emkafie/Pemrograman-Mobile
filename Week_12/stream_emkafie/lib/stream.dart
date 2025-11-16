import 'dart:async'; // Tambahan dari Langkah 1
import 'package:flutter/material.dart';

// Class dari Praktikum 1
class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.pink,
    Colors.indigo,
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(
      const Duration(seconds: 1), (int t) {
        int index = t % colors.length;
        return colors[index];
      }
    );
  }
}

// Class baru dari Langkah 2-5
class NumberStream {
  // Variabel dari Langkah 3
  final StreamController<int> controller = StreamController<int>();

  // Method dari Langkah 4
  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }

  // Method dari Langkah 13
  addError() {
    controller.sink.addError('error');
  }

  // Method dari Langkah 5
  close() {
    controller.close();
  }
}