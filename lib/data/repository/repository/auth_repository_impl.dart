import 'package:E_commerce/domain/entity/auth_result_entity.dart';
import 'package:E_commerce/domain/failures.dart';
import 'package:E_commerce/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:E_commerce/domain/repository/repository/auth_repository_contract.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepositoryContract{
  AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email, String password, String rePassword, String phone) {
    return remoteDataSource.register(name, email, password, rePassword, phone);
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }
  
}