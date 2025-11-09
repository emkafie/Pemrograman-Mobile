import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  late Color color; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second - Farrel M Kafie'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Orange'),
              onPressed: () {
                color = Colors.orange; 
                Navigator.pop(context, color);
              },
            ),

            ElevatedButton(
              child: const Text('Teal'), 
              onPressed: () {
                color = Colors.teal;
                Navigator.pop(context, color); 
              },
            ),

            // 3. Tombol Warna Favorit 3
            ElevatedButton(
              child: const Text('Indigo'),
              onPressed: () {
                color = Colors.indigo;
                Navigator.pop(context, color);
              },
            ),
          ],
        ),
      ),
    );
  }
}