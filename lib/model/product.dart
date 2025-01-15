class Product {
  final int id;
  final String name;
  final num price;
  final num quantity;
  final String unit;
  final ProductStatus status;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.unit,
    required this.status,
  });
}

enum ProductStatus { inStock, outStock, lowStock }
