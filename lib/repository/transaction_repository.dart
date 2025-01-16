import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_stock_management_app/core/services/database_helper.dart';
import 'package:product_stock_management_app/model/product.dart';
import 'package:product_stock_management_app/model/transaction.dart';

final transactionRepositoryProvider = Provider.autoDispose<TransactionRepository>(
  (ref) {
    final dbHelper = ref.read(databaseProvider);
    return TransactionRepository(dbHelper);
  },
);

class TransactionRepository {
  final DatabaseHelper _dbHelper;

  TransactionRepository(this._dbHelper);

  Future<Either<String, Unit>> addTransaction(Transaction transaction) async {
    try {
      final db = await _dbHelper.database;
      final adjustment = transaction.quantityChange;
      Future.wait([
        db.insert(DatabaseHelper.transactionTable, transaction.toJson()),
        db.rawUpdate(
          '''
        UPDATE ${DatabaseHelper.productTable}
        SET quantity = quantity + ?
        WHERE id = ?
        ''',
          [adjustment, transaction.productId],
        ),
      ]);
      return const Right(unit);
    } catch (error) {
      return const Left('Something went wrong');
    }
  }

  Future<Either<String, List<Transaction>>> getAllTransactions() async {
    try {
      final db = await _dbHelper.database;
      // String query = "SELECT * FROM ${DatabaseHelper.transactionTable}";

      String query = '''
      SELECT 
        transactions.id AS id, 
        transactions.product_id, 
        transactions.quantity_changed, 
        transactions.date, 
        products.name AS product_name
      FROM ${DatabaseHelper.transactionTable} AS transactions
      INNER JOIN ${DatabaseHelper.productTable} AS products
      ON transactions.product_id = products.id
    ''';
      final result = await db.rawQuery(query);
      return Right(Transaction.fromJsonList(result));
    } catch (error) {
      print("Error $error");
      return const Left('Something went wrong');
    }
  }
}
