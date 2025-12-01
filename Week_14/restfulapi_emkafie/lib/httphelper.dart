import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'pizza.dart';

class HttpHelper {
  // --- MULAI Pola Singleton ---
  static final HttpHelper _httpHelper = HttpHelper._internal();

  // Private constructor
  HttpHelper._internal();

  // Factory constructor
  factory HttpHelper() {
    return _httpHelper;
  }
  // --- SELESAI Pola Singleton ---

  final String authority = 'q621g.wiremockapi.cloud';
  final String path = 'pizzalist';

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);
    final http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      //provide a type argument to the map method to avoid type
      //error
      List<Pizza> pizzas = jsonResponse
          .map<Pizza>((i) => Pizza.fromJson(i))
          .toList();
      return pizzas;
    } else {
      return [];
    }
  }

  Future<String> postPizza(Pizza pizza) async {
    const postPath = '/pizza';
    // Mengubah object Pizza menjadi JSON string
    String post = json.encode(pizza.toJson());

    // Pastikan authority sudah benar sesuai WireMock Anda
    Uri url = Uri.https(authority, postPath);

    final http.Response result = await http.post(
      url,
      body: post,
      // Penting: Beritahu server bahwa kita mengirim JSON
      headers: {"Content-Type": "application/json"},
    );

    return result.body;
  }

  Future<String> putPizza(Pizza pizza) async {
    const putPath = '/pizza';
    String put = json.encode(pizza.toJson());

    // Pastikan authority sudah benar sesuai konfigurasi Anda
    Uri url = Uri.https(authority, putPath);

    final http.Response result = await http.put(
      url,
      body: put,
      headers: {"Content-Type": "application/json"},
    );

    return result.body;
  }

  Future<String> deletePizza(int id) async {
    final String deletePath = '/pizza/$id';
    Uri url = Uri.https(authority, deletePath);
    
    // Melakukan request DELETE
    final http.Response result = await http.delete(url);

    return result.body;
  }
}
