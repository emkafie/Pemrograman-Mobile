// (Langkah 9: Imports)
import 'package:flutter/material.dart';
import 'random_bloc.dart';

// (Langkah 10: StatefulWidget)
class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  
  // (Langkah 11: Variabel bloc)
  final _bloc = RandomNumberBloc();

  // (Langkah 13: method build)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Number BLoC')),
      body: Center(
        child: StreamBuilder<int>(
          // 3. Hubungkan ke OUTPUT BLoC
          stream: _bloc.randomNumber, 
          initialData: 0,
          builder: (context, snapshot) {
            return Text(
              'Random Number: ${snapshot.data}',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // 1. Kirim event ke INPUT BLoC
        onPressed: () => _bloc.generateRandom.add(null), 
        child: const Icon(Icons.refresh),
      ),
    );
  }

  // (Langkah 12: method dispose)
  @override
  void dispose() {
    _bloc.dispose(); // Jangan lupa dispose BLoC-nya!
    super.dispose();
  }
}