import 'package:basic_nav/models/item.dart';
import 'package:basic_nav/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Buat data dummy sesuai dengan model Item yang baru
  final List<Item> items = [
    Item(
      name: 'Gula Pasir 1kg',
      price: 18000,
      imageUrl: '/images/gula.jpeg',
      stock: 15,
      rating: 4.8,
    ),
    Item(
      name: 'Minyak Goreng 2L',
      price: 35000,
      imageUrl: '/images/minyak.jpeg',
      stock: 20,
      rating: 4.9,
    ),
    Item(
      name: 'Beras Pandan Wangi 5kg',
      price: 72000,
      imageUrl: '/images/beras.jpeg',
      stock: 8,
      rating: 4.7,
    ),
    Item(
      name: 'Kecap Manis Botol',
      price: 22000,
      imageUrl: '/images/kecap.jpeg',
      stock: 32,
      rating: 4.6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toko Hebat"),
        backgroundColor: Colors.blueGrey,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Menampilkan 2 item per baris
          crossAxisSpacing: 10.0, // Jarak horizontal antar item
          mainAxisSpacing: 10.0, // Jarak vertikal antar item
          childAspectRatio: 0.75, // Rasio lebar-tinggi item card
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ProductCard(item: items[index]);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigasi ke ItemPage sambil mengirim data 'item'
        context.push('/item', extra: item);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // IMPLEMENTASI HERO WIDGET
            Hero(
              tag: 'productImage_${item.name}', // Tag unik untuk setiap item
              child: Image.network(
                item.imageUrl,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Rp ${item.price}'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(item.rating.toString()),
                    ],
                  ),
                  Text('Stok: ${item.stock}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      color: Colors.blueGrey.shade800,
      child: const Column(
        children: [
          Text(
            'Nama: Farrel Muchammad Kafie', // Ganti dengan nama Anda
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            'NIM: 2341720176', // Ganti dengan NIM Anda
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
