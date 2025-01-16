class Transaction {
  final int id;
  final int productId;
  final String productName;
  final num quantityChange;
  final String date;

  Transaction({
    required this.id,
    required this.productId,
    required this.productName,
    required this.quantityChange,
    required this.date,
  });
}
