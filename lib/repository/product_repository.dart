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

  Future<Either<String, List<Product>>> getAllProducts() async {
    try {
      final db = await _dbHelper.database;
      final result = await db.query(DatabaseHelper.productTable);
      return Right(Product.fromJsonList(result));
    } catch (error) {
      return const Left('Something went wrong');
    }
  }
}
