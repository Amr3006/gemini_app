import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var obscured = false;

  void changeObscurity() {
    obscured = !obscured;
    emit(ChangeObscurityState());
  }
}
