class Product {
  int? id;
  String? name;
  num? price;
  num? quantity;
  ProductStatus? status;

  Product({
    this.id,
    this.name,
    this.price,
    this.quantity,
    this.status = ProductStatus.lowStock,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    status = _getStatus(json['quantity']);
  }

  ProductStatus _getStatus(num value) {
    if (value == 0) {
      return ProductStatus.outStock;
    }
    if (value < 15) {
      return ProductStatus.lowStock;
    }
    return ProductStatus.inStock;
  }

  static List<Product> fromJsonList(dynamic jsonList) {
    return (jsonList as List<dynamic>).map((item) => Product.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    return data;
  }
}

enum ProductStatus { inStock, outStock, lowStock }
