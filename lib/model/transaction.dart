class Transaction {
  final int id;
  final int productId;
  final String productName;
  final num quantityChange;
  final String date;

  Transaction({
    required this.id,
    required this.productId,
    this.productName = '',
    required this.quantityChange,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['quantity_changed'] = quantityChange;
    data['date'] = date;
    return data;
  }
}
