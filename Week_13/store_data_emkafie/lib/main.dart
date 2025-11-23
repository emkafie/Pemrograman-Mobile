import 'dart:convert';
import './model/pizza.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo - Emkafie',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pizza> myPizzas = [];
  String pizzaString = '';
  int appCounter = 0;

  String documentsPath = '';
  String tempPath = '';

  late File myFile;
  String fileText = '';

  final pwdController = TextEditingController();
  String myPass = '';

  final storage = const FlutterSecureStorage();
  final String myKey = 'myPass';

  Future<void> writeToSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
  }

  Future<void> readFromSecureStorage() async {
    String? secret = await storage.read(key: myKey);
    setState(() {
      myPass = secret ?? 'No data found';
    });
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/pizzalist.json');
    List pizzaMapList = jsonDecode(myString);
    List<Pizza> myPizzas = [];
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }
    String json = convertToJSON(myPizzas);
    debugPrint(json);
    return myPizzas;
  }

  Future<void> deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    setState(() {
      appCounter = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    readAndWritePreference();
    getPaths();

    getPaths().then((_) {
      myFile = File('$documentsPath/pizzas.txt');
      writeFile();
    });
    // readJsonFile().then((value) {
    //   setState(() {
    //     myPizzas = value;
    //   });
    // });
  }

  Future<void> readFile() async {
    try {
      String content = await myFile.readAsString();
      setState(() {
        fileText = content;
      });
    } catch (e) {
      setState(() {
        fileText = 'Error reading file: $e';
      });
    }
  }

  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Farrel Muchammad Kafie - 2341720176');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> getPaths() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final temporaryDirectory = await getTemporaryDirectory();

    setState(() {
      documentsPath = documentDirectory.path;
      tempPath = temporaryDirectory.path;
    });
  }

  Future<void> readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++;
    await prefs.setInt('appCounter', appCounter);

    setState(() {
      appCounter = appCounter;
    });
  }

  String convertToJSON(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => jsonEncode(pizza)).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Doc Path:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(documentsPath),
              const SizedBox(height: 20),
              const Text(
                'File Content:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(fileText, style: const TextStyle(color: Colors.blue)),
              ElevatedButton(
                onPressed: readFile,
                child: const Text('Read File'),
              ),
              const Divider(height: 40, thickness: 2),
              const Text(
                'Secure Storage Demo',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              TextField(
                controller: pwdController,
                decoration: const InputDecoration(
                  labelText: 'Enter Password / Secret Data',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      writeToSecureStorage();
                      pwdController.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data Saved Securely!')),
                      );
                    },
                    child: const Text('Save Value'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      readFromSecureStorage();
                    },
                    child: const Text('Read Value'),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Text(
                'Read Result:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                myPass,
                style: const TextStyle(fontSize: 16, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
