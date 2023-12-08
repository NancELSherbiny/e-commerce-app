import 'package:E_commerce/domain/repository/repository/auth_repository_contract.dart';
import 'package:dartz/dartz.dart';
import '../entity/auth_result_entity.dart';
import '../failures.dart';

  class RegisterUseCase{
  AuthRepositoryContract repositoryContract;
  RegisterUseCase({required this.repositoryContract});

  Future<Either<Failures, AuthResultEntity>>invoke(String name, String email, String password, String rePassword,
      String phone){
    return repositoryContract.register(name, email, password, rePassword, phone);
  }
}