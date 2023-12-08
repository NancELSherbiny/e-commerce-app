import '../../../domain/entity/auth_result_entity.dart';
import 'UserDto.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti22@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MDdhYTlkMDg5ZjVhOTk4ZGVkZTQ1YSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzAxOTg4MDI3LCJleHAiOjE3MDk3NjQwMjd9.5R1NIGKW3PZrGGMDNiVU86j2JxhwIihW-rG3CCFgQqg"

class LoginResponseDto {
  LoginResponseDto({this.message, this.user, this.token, this.statusMsg});

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(token: token, userEntity: user?.toUserEntity());
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map[' statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
}
