class Product {
  final int? id;
  final String name;
  final num price;
  final num quantity;
  final ProductStatus status;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.quantity,
    this.status = ProductStatus.lowStock,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    return data;
  }
}

enum ProductStatus { inStock, outStock, lowStock }
