import 'package:basic_nav/models/item.dart';
import 'package:basic_nav/pages/home_page.dart';
import 'package:basic_nav/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp()
  );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    // Rute untuk halaman utama
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
    ),
    // Rute untuk halaman detail
    GoRoute(
      path: '/item',
      builder: (BuildContext context, GoRouterState state) {
        // Ambil objek Item yang dikirim sebagai 'extra'
        final Item item = state.extra as Item;
        return ItemPage(item: item);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Gunakan MaterialApp.router
    return MaterialApp.router(
      title: 'Toko Hebat',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: _router, // Terapkan konfigurasi router
    );
  }
}
