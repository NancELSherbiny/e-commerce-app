import 'package:E_commerce/domain/use_case/di.dart';
import 'package:E_commerce/ui/auth/register/cubit/register_screen_view_model.dart';
import 'package:E_commerce/ui/auth/register/cubit/register_states.dart';
import 'package:E_commerce/ui/utils/dialog_utils.dart';
import 'package:E_commerce/ui/utils/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/text_field_item.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel viewModel =
      RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage ?? 'waiting');
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              title: 'Error', positiveActionName: "Ok");
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, 'Register successfully',
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
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
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
                                  fieldName: 'user name',
                                  hintText: 'enter your name',
                                  controller: viewModel.nameController,
                                  validator: (text) {
                                    if (text == null ) {
                                      return 'Please enter User Name';
                                    }
                                    return null;
                                  }),
                              TextFieldItem(
                                fieldName: 'Email',
                                keyboardType: TextInputType.emailAddress,
                                hintText: 'enter your email',
                                controller: viewModel.emailController,
                                validator: (text) {
                                  if (text == null ) {
                                    return 'Please enter Email';
                                  }
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
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
                                  onTap: () {
                                    if (viewModel.isObscure) {
                                      viewModel.isObscure = false;
                                    } else {
                                      viewModel.isObscure = true;
                                    }
                                    setState(() {});
                                  },
                                  child: viewModel.isObscure
                                      ? Icon(Icons.visibility_off, color: Colors.black54,)
                                      : Icon(Icons.visibility, color: Colors.black54,),
                                ),
                                hintText: 'enter your password',
                                controller: viewModel.passwordController,
                                validator: (text) {
                                  if (text == null ) {
                                    return 'Please enter Password';
                                  }
                                  if (text.length < 6) {
                                    return 'Password should be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              TextFieldItem(
                                fieldName: 'Confirm password',
                                keyboardType: TextInputType.number,
                                isObscure: viewModel.isObscure,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    if (viewModel.isObscure) {
                                      viewModel.isObscure = false;
                                    } else {
                                      viewModel.isObscure = true;
                                    }
                                  },
                                  child: viewModel.isObscure
                                      ? Icon(Icons.visibility_off, color: Colors.black54,)
                                      : Icon(Icons.visibility, color: Colors.black54,)
                                ),
                                hintText: 'enter password again',
                                controller: viewModel.confirmPasswordController,
                                validator: (text) {
                                  if (text == null ) {
                                    return 'Please enter Confirmation Password';
                                  }
                                  if (text !=
                                      viewModel.passwordController.text) {
                                    return 'Password does not match';
                                  }
                                  return null;
                                },
                              ),
                              TextFieldItem(
                                  fieldName: 'phone number',
                                  keyboardType: TextInputType.phone,
                                  hintText: 'enter your phone number',
                                  controller: viewModel.phoneController,
                                  validator: (text) {
                                    if (text!.length != 11) {
                                      return 'incorrect';
                                    }
                                    return null;
                                  }),
                              Padding(
                                padding: EdgeInsets.only(top: 35.h),
                                child: ElevatedButton(
                                  onPressed: () {
                                    viewModel.register();
                                  },
                                  child: SizedBox(
                                    height: 64.h,
                                    width: 398.w,
                                    child: Center(
                                      child: Text(
                                        'sign up',
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
                                    Navigator.of(context)
                                        .pushNamed(LoginScreen.routeName);
                                  },
                                  child: Text('Account already exists'))
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
      ),
    );
  }
}
