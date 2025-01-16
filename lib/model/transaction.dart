class Transaction {
  int? id;
  int? productId;
  String? productName;
  num? quantityChange;
  String? date;

  Transaction({
    this.id,
    this.productId,
    this.productName,
    this.quantityChange,
    this.date,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    quantityChange = json['quantity_changed'];
    date = json['date'];
  }

  static List<Transaction> fromJsonList(dynamic jsonList) {
    return (jsonList as List<dynamic>).map((item) => Transaction.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['quantity_changed'] = quantityChange;
    data['date'] = date;
    return data;
  }
}
