import 'dart:async';
import 'package:books/geolocation.dart';
import 'package:books/navigation_dialog.dart';
import 'package:books/navigation_first.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo - Farrel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const NavigationDialogScreen(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  bool isLoading = false;

  Future<http.Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/tFHCAgAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }

  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future count() async {
    int total = 0;
    total += await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }

  late Completer completer;

  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  Future calculate() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
    } catch (_) {
      completer.completeError('Error occured');
    }
  }

  void returnFG() {
    // Using Future.wait
    final futures = Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync(),
    ]);
    futures.then((List<int> values) {
      int total = 0;
      for (var value in values) {
        total += value;
      }
      setState(() {
        result = total.toString();
      });
    });

    // Using FutureGroup from async package
    // FutureGroup<int> futureGroup = FutureGroup<int>();
    // futureGroup.add(returnOneAsync());
    // futureGroup.add(returnTwoAsync());
    // futureGroup.add(returnThreeAsync());
    // futureGroup.close();
    // futureGroup.future.then((List<int> values) {
    //   int total = 0;
    //   for (var value in values) {
    //     total += value;
    //   }
    //   setState(() {
    //     result = total.toString();
    //   });
    // });
  }

  
  Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('This is an error');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Future Demo - Farrel')),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              child: const Text('GO'),
              onPressed: isLoading
                  ? null
                  : () {
                      
                      returnError().then((value) {
                        setState(() {
                          result = 'Success';
                        });
                      }).catchError((onError) {
                        setState(() {
                          result = onError.toString();
                        });
                      }).whenComplete(() => print("Complete"));

                      // PRAK 4
                      // returnFG();

                      // PREVIOUS CODE FOR REFERENCE PRAK 3
                      // getNumber()
                      //     .then((value) {
                      //       setState(() {
                      //         result = value.toString();
                      //       });
                      //     })
                      //     .catchError((e) {
                      //       result = 'An error occurred';
                      //     });

                      // Previous code for reference PRAK 1
                      // setState(() {
                      //   isLoading = true;
                      // });

                      // getData()
                      //     .then((value) {
                      //       setState(() {
                      //         result = value.body.toString().substring(0, 450);
                      //       });
                      //     })
                      //     .catchError((_) {
                      //       setState(() {
                      //         result = 'Error occured';
                      //       });
                      //     })
                      //     .whenComplete(() {
                      //       setState(() {
                      //         isLoading = false;
                      //       });
                      //     });
                    },
            ),
            const Spacer(),
            Text(result),
            const Spacer(),
            // if (isLoading)
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
