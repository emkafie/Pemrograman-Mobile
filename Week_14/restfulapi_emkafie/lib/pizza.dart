class Pizza {
  int id;
  String pizzaName;
  String description;
  double price;
  String imageUrl;
  // SOAL 2: Tambahan field baru
  String category; 

  // Constructor dengan default value agar bisa dipanggil Pizza()
  Pizza({
    this.id = 0,
    this.pizzaName = '',
    this.description = '',
    this.price = 0.0,
    this.imageUrl = '',
    this.category = 'General', // Default value category
  });

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: json['id'] ?? 0,
      pizzaName: json['pizzaName'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      imageUrl: json['imageUrl'] ?? '',
      category: json['category'] ?? 'General',
    );
  }

  // Method untuk mengubah object ke JSON (Dibutuhkan untuk POST)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      // Sertakan field baru di sini
      'category': category, 
    };
  }
}