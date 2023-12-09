import 'dart:convert';
import 'package:E_commerce/data/model/api/api_constants.dart';
import 'package:E_commerce/data/model/request/RegisterRequest.dart';
import 'package:E_commerce/data/model/request/loginRequest.dart';
import 'package:E_commerce/data/model/response/RegisterResponseDto.dart';
import 'package:E_commerce/data/model/response/loginResponseDto.dart';
import 'package:E_commerce/domain/failures.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();
  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  //https://ecommerce.routemisr.com/api/v1/auth/signup

  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var registerBody = RegisterRequest(
        name: name,
        email: email,
        password: password,
        phone: phone,
        rePassword: password,
      );
      var response = await http.post(url, body: registerBody.toJson());
      var registerResponse =
          RegisterResponseDto.fromJson(jsonDecode(response.body));
      RegisterResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(ServerError(errorMessage: registerResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check your internet connection'));
    }
  }

  Future<Either<Failures, LoginResponseDto>> login(
    String email,
    String password,
  ) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginApi);
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var loginBody = LoginRequest(email: email, password: password);
      var response = await http.post(url, body: loginBody.toJson());
      var loginResponse = LoginResponseDto.fromJson(jsonDecode(response.body));
      LoginResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(ServerError(errorMessage: loginResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check your internet connection'));
    }
  }
}
