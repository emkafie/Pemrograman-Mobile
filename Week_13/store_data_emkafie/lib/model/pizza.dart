const keyId = 'id';
const keyPizzaName = 'pizzaName';
const keyDescription = 'description';
const keyPrice = 'price';
const keyImageUrl = 'imageUrl';

class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: int.tryParse(json[keyId].toString()) ?? 0,
      
      pizzaName: (json[keyPizzaName] != null) 
          ? json[keyPizzaName].toString() 
          : 'No Name',
      
      description: (json[keyDescription] != null) 
          ? json[keyDescription].toString() 
          : 'No Description Provided',
      
      price: double.tryParse(json[keyPrice].toString()) ?? 0.0,
      
      imageUrl: (json[keyImageUrl] != null) 
          ? json[keyImageUrl].toString() 
          : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyPizzaName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImageUrl: imageUrl,
    };
  }
}
