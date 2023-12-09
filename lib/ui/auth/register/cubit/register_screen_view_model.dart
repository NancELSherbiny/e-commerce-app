import 'package:E_commerce/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/use_case/register_use_case.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates>{
  RegisterUseCase registerUseCase;

RegisterScreenViewModel({required this.registerUseCase}):super(RegisterInitialState());
///HOLD DATA - HANDLE LOGIC

var formKey = GlobalKey<FormState>();

var nameController = TextEditingController();

var passwordController = TextEditingController();

var confirmPasswordController = TextEditingController();

var emailController = TextEditingController();

var phoneController = TextEditingController();

bool isObscure = true;
void register() async {

  if(formKey.currentState?.validate() == true){
    ///logic
    emit(RegisterLoadingState(loadingMessage: 'Loading...'));
    var either = await registerUseCase.invoke(nameController.text, emailController.text, passwordController.text,
        confirmPasswordController.text, phoneController.text);
    either.fold((l) {
      emit(RegisterErrorState(errorMessage: l.errorMessage));
    }, (response)
    {
     emit(RegisterSuccessState(resultEntity: response));
  
});
  }
}
}