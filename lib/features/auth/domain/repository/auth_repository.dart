import 'package:bloc_clean_architecture/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> singUpWithEmailPassword(
      {required String name, required String email, required String password});
  Future<Either<Failure, String>> loginWithEmailPassword(
      {required String email, required String password});
}
