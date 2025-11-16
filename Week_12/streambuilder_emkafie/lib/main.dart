import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async'; // Diperlukan untuk Stream

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Ganti title dengan nama Anda
      title: 'StreamBuilder - EMKAFIE', 
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  
  // (Langkah 5: Tambah variabel)
  late Stream<int> numberStream;

  // (Langkah 6: Edit initState)
  @override
  void initState() {
    numberStream = NumberStream().getNumbers();
    super.initState();
  }

  // (Langkah 7: Edit method build)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Ganti title dengan nama Anda
        title: const Text('StreamBuilder - EMKAFIE'), 
      ),
      body: StreamBuilder<int>(
        stream: numberStream,
        initialData: 0,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error!');
          }
          if (snapshot.hasData) {
            return Center(
              child: Text(
                snapshot.data.toString(),
                style: const TextStyle(fontSize: 96),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}