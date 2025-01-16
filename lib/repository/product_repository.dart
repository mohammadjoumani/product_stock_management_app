import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_stock_management_app/core/services/database_helper.dart';
import 'package:product_stock_management_app/model/product.dart';

final productRepositoryProvider = Provider.autoDispose<ProductRepository>(
  (ref) {
    final dbHelper = ref.read(databaseProvider);
    return ProductRepository(dbHelper);
  },
);

class ProductRepository {
  final DatabaseHelper _dbHelper;

  ProductRepository(this._dbHelper);

  Future<Either<String, Unit>> addProduct(Product product) async {
    try {
      final db = await _dbHelper.database;
      await db.insert(DatabaseHelper.productTable, product.toJson());
      return const Right(unit);
    } catch (error) {
      return const Left('Something went wrong');
    }
  }

  Future<Either<String, List<Product>>> getAllProducts({
    ProductStatus? productStatus,
    num? minPrice,
    num? maxPrice,
  }) async {
    try {
      final db = await _dbHelper.database;
      String query = "SELECT * FROM ${DatabaseHelper.productTable}";
      List<dynamic> arguments = [];
      if (productStatus != null) {
        switch (productStatus) {
          case ProductStatus.inStock:
            query += " WHERE quantity > ?";
            arguments.add(15);
            break;
          case ProductStatus.lowStock:
            query += " WHERE quantity > ? AND quantity <= ?";
            arguments.add(0);
            arguments.add(15);
            break;
          case ProductStatus.outStock:
            query += " WHERE quantity = ?";
            arguments.add(0);
            break;
        }
      }
      if (minPrice != null && maxPrice != null) {
        if (productStatus != null) {
          query += " AND price BETWEEN ? AND ?";
        } else {
          query += " WHERE price BETWEEN ? AND ?";
        }
        arguments.add(minPrice);
        arguments.add(maxPrice);
      }
      final result = await db.rawQuery(query, arguments);
      return Right(Product.fromJsonList(result));
    } catch (error) {
      return const Left('Something went wrong');
    }
  }
}
