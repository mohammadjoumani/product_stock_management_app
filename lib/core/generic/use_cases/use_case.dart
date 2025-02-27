import 'package:dartz/dartz.dart';
import 'package:product_stock_management_app/core/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> call(In input);
}

abstract class UseCase<In, Out> {
  Future<Out> call(In input);
}
