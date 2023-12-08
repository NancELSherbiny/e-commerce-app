import 'package:E_commerce/domain/repository/repository/auth_repository_contract.dart';
import 'package:dartz/dartz.dart';
import '../entity/auth_result_entity.dart';
import '../failures.dart';

class LoginUseCase{
  AuthRepositoryContract repositoryContract;
  LoginUseCase({required this.repositoryContract});

  Future<Either<Failures, AuthResultEntity>>invoke( String email, String password){
    return repositoryContract.login(email, password);
  }
}