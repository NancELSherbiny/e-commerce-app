import 'package:E_commerce/ui/auth/login/login_screen.dart';
import 'package:E_commerce/ui/auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430,932),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (_ , child) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: RegisterScreen.routeName ,
    routes: {
        RegisterScreen.routeName: (context) => RegisterScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        });
    },
    );

}
}
