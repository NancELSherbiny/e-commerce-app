import 'package:E_commerce/domain/entity/auth_result_entity.dart';
import 'package:E_commerce/domain/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepositoryContract{

  Future<Either<Failures,AuthResultEntity>>register (String name, String email, String password, String rePassword,
      String phone);

  Future<Either<Failures,AuthResultEntity>>login(String email, String password);

}