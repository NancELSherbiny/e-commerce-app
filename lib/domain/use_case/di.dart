import 'package:E_commerce/data/model/api/api_manager.dart';
import 'package:E_commerce/data/repository/data_source/auth_remote_data_source_impl.dart';
import 'package:E_commerce/data/repository/repository/auth_repository_impl.dart';
import 'package:E_commerce/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:E_commerce/domain/repository/repository/auth_repository_contract.dart';
import 'package:E_commerce/domain/use_case/register_use_case.dart';

import 'login_use_case.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(repositoryContract: injectAuthRepositoryContract());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(repositoryContract: injectAuthRepositoryContract());
}
AuthRepositoryContract injectAuthRepositoryContract(){
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}