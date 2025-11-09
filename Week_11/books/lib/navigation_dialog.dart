import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700;


  _showColorDialog(BuildContext context) async {

    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Pilih warna favoritmu!'),
          content: const Text('Silakan pilih sebuah warna'),
          actions: <Widget>[
            
            TextButton(
              child: const Text('Orange'), 
              onPressed: () {
                color = Colors.orange; 
                Navigator.pop(context, color);
              },
            ),
            

            TextButton(
              child: const Text('Teal'), 
              onPressed: () {
                color = Colors.teal; 
                Navigator.pop(context, color);
              },
            ),
            
            TextButton(
              child: const Text('Indigo'), 
              onPressed: () {
                color = Colors.indigo; 
                Navigator.pop(context, color);
              },
            ),
          ],
        );
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color, 
      appBar: AppBar(
        title: const Text('Dialog Navigation - Farrel M Kafie'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }
}