import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            /* soal 1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* soal 2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wisata Danau Ranu Regulo',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'TNBTS, Malang, Indonesia',
                  style: TextStyle(fontFamily: 'Roboto'),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.red[500]),
              const Text('41'),
            ],
          ),
          /* soal 3*/
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Danau Ranu Regulo adalah sebuah danau yang terletak'
        'di kawasan Taman Nasional Bromo Tengger Semeru, '
        'Jawa Timur, Indonesia. Danau ini berada di ketinggian'
        ' sekitar 2.000 meter di atas permukaan laut dan dikelilingi'
        ' oleh pegunungan yang indah. Danau Ranu Regulo memiliki keindahan'
        ' alam yang memukau dengan airnya yang jernih dan pemand',
        softWrap: true,
      ),
    );

    Widget imageRow = Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Image.asset('images/lake2.jpg')),
          Expanded(flex: 2, child: Image.asset('images/lake3.jpg')),
          Expanded(child: Image.asset('images/lake4.jpg')),
        ],
      ),
    );

    Widget footer = Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[200],
      alignment: Alignment.center,
      child: const Text(
        '© 2025 Farrel Muchammad Kafie',
        style: TextStyle(fontSize: 14, color: Colors.black54),
      ),
    );

    return MaterialApp(
      title: 'Farrel Muchammad Kafie - 2341720176',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Farrel Muchammad Kafie - 2341720176'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
            imageRow,
            footer,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
