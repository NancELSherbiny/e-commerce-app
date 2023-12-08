import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/use_case/login_use_case.dart';
import 'login_states.dart';

class LoginScreenViewModel extends Cubit<LoginStates>{
  LoginUseCase loginUseCase;

LoginScreenViewModel({required this.loginUseCase}):super(LoginInitialState());
///HOLD DATA - HANDLE LOGIC

var formKey = GlobalKey<FormState>();

var passwordController = TextEditingController();

var emailController = TextEditingController();

bool isObscure = true;
Future<void> login() async {

  if(formKey.currentState?.validate() == true){
    ///logic
    emit(LoginLoadingState(loadingMessage: 'Loading...'));
    var either = await loginUseCase.invoke(emailController.text, passwordController.text);
    either.fold((l) {
      emit(LoginErrorState(errorMessage: l.errorMessage));
    }, (response)
    {
     emit(LoginSuccessState(resultEntity: response));
  
});
  }
}
}