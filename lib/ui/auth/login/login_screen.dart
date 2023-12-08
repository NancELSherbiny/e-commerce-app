import 'package:E_commerce/domain/use_case/di.dart';
import 'package:E_commerce/ui/auth/login/cubit/login_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/dialog_utils.dart';
import '../../utils/mytheme.dart';
import '../../utils/text_field_item.dart';
import '../register/register_screen.dart';
import 'cubit/login_states.dart';


class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenViewModel viewModel = LoginScreenViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel,LoginStates>(
        bloc: viewModel,
        listener: (context,state){
          if (state is LoginLoadingState) {
            DialogUtils.showLoading(context, state.loadingMessage ?? 'waiting');
          } else if (state is LoginErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context, state.errorMessage!,
                title: 'Error', positiveActionName: "Ok");
          } else if (state is LoginSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context, 'Login successfully',
                title: 'Success', positiveActionName: "Ok");
          }
        },
        child: Scaffold(
    body: Container(
    color: MyTheme.primary,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 91.h,
                bottom: 46.h,
                left: 97.w,
                right: 97.w,
              ),
              child: Image.asset('assets/images/route_pic.png'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Form(
                      key: viewModel.formKey,
                      child: Column(
                        children: [
                          TextFieldItem(
                            fieldName: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            hintText: 'enter your email',
                            controller: viewModel.emailController,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter Email';
                              }
                              bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(text);
                              if (!emailValid) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                          ),
                          TextFieldItem(
                            fieldName: 'Password',
                            keyboardType: TextInputType.number,
                            isObscure: viewModel.isObscure,
                            suffixIcon: InkWell(
                              child: viewModel.isObscure
                                  ?Icon(Icons.visibility_off,color: Colors.black54,)
                                  :Icon(Icons.visibility,color: Colors.black54,),
                              onTap:(){
                                if(viewModel.isObscure){
                                  viewModel.isObscure = false;
                                }else{
                                  viewModel.isObscure = true;
                                }
                                setState(() {

                                });
                              },

                            ),
                            hintText: 'enter your password',
                            controller: viewModel.passwordController,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter Password';
                              }
                              if (text.length < 6) {
                                return 'Password should be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 35.h),
                            child: ElevatedButton(
                              onPressed: () {
                                viewModel.login();
                              },
                              child: SizedBox(
                                height: 64.h,
                                width: 398.w,
                                child: Center(
                                  child: Text(
                                    'sign in',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                        color: MyTheme.primary,
                                        fontSize: 25.sp),
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.r))),
                                  padding:
                                  EdgeInsets.symmetric(vertical: 6)),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, RegisterScreen.routeName);
                              },
                              child: Text('Do not have an account'))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
    ) );

  }
}
