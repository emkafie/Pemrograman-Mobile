import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async'; // Tambahan dari Langkah 6
import 'dart:math'; // Tambahan dari Langkah 6

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream - EMKAFIE', // Sesuaikan dengan nama Anda
      theme: ThemeData(
        primarySwatch: Colors.teal, // Sesuaikan dengan warna Anda
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
  late StreamTransformer transformer;
  late StreamSubscription subscription;

  late StreamSubscription subscription2;
  String values = '';

  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  // Variabel baru dari Langkah 7
  int lastNumber = 0;
  late StreamController numberStreamController;
  late NumberStream numberStream;

  // Method dari praktikum 1
  void changeColor() {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  // Method baru dari Langkah 10
  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);

    // (Langkah 8)
    // Cek dulu apakah stream-nya masih terbuka
    if (!numberStreamController.isClosed) {
      numberStream.addNumberToSink(myNum);
    } else {
      // Jika sudah ditutup, set angka ke -1
      setState(() {
        lastNumber = -1;
      });
    }
  }

  // Edit initState dari Langkah 8
  @override
  void initState() {
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream.asBroadcastStream();

    // (Langkah 2)
    // .listen() mengembalikan 'StreamSubscription', kita simpan di variabel
    subscription = stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    });

    // (Langkah 3)
    // Menambahkan listener Error ke subscription
    subscription.onError((error) {
      setState(() {
        lastNumber = -1;
      });
    });

    // (Langkah 4)
    // Menambahkan listener onDone ke subscription
    // Ini akan terpanggil saat stream ditutup (close)
    subscription = stream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });

    super.initState();
  }

  void stopStream() {
    numberStreamController.close();
  }

  // Edit dispose dari Langkah 9
  @override
  void dispose() {
    // (Langkah 6)
    // Kita berhenti berlangganan (bukan menutup controller)
    subscription.cancel();
    super.dispose();
  }

  // Edit build method dari Langkah 11
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream - EMKAFIE'),
      ),
      // Ganti body dari praktikum 1
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(values, style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () => addRandomNumber(),
              child: Text('New Random Number'),
            ),
            ElevatedButton(
              onPressed: () => stopStream(),
              child: const Text('Stop Subscription'),
            ),
          ],
        ),
      ),
    );
  }
}
