import 'package:dartz/dartz.dart';
import 'package:error_handler/core/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}