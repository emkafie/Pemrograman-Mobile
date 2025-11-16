import 'dart:async'; // Diperlukan untuk Stream.periodic
import 'dart:math';   // Diperlukan untuk Random

// (Langkah 2: class NumberStream {})
// (Langkah 3: Menambahkan method getNumbers)
class NumberStream {
  Stream<int> getNumbers() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      Random random = Random();
      int myNum = random.nextInt(10);
      return myNum;
    });
  }
}