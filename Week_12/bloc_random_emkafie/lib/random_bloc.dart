import 'dart:async';
import 'dart:math';

// (Langkah 3: class RandomNumberBloc)
class RandomNumberBloc {
  
  // (Langkah 4: StreamControllers)
  // StreamController untuk input events
  final _generateRandomController = StreamController<void>();
  // StreamController untuk output
  final _randomNumberController = StreamController<int>();

  // Input Sink
  Sink<void> get generateRandom => _generateRandomController.sink;
  // Output Stream
  Stream<int> get randomNumber => _randomNumberController.stream;

  // (Langkah 5: Constructor)
  RandomNumberBloc() {
    // Dengarkan event yang masuk dari input
    _generateRandomController.stream.listen((_) {
      // Logika bisnis: buat angka acak
      final random = Random().nextInt(10);
      // Tambahkan hasil ke output
      _randomNumberController.sink.add(random);
    });
  }

  // (Langkah 6: method dispose)
  void dispose() {
    _generateRandomController.close();
    _randomNumberController.close();
  }
}