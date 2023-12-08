/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmed500@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NmI3NDU3MjgxYzkxNmM3YTdiMzY4OCIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzAxNTQwOTUyLCJleHAiOjE3MDkzMTY5NTJ9.C3ru8DIJ8_yfddZWZt2HJu5ix6atehN7-IRAL2yDdkA"

class AuthResultEntity {
  AuthResultEntity({
      this.message, 
      this.userEntity,
      this.token,});

  String? message;
  UserEntity? userEntity;
  String? token;

}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmed500@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
      this.name, 
      this.email,});

  String? name;
  String? email;

}