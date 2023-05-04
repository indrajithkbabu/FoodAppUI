// ignore_for_file: inference_failure_on_instance_creation, sort_constructors_first, lines_longer_than_80_chars

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodieapp/signUp/repo/api_repository.dart';
part 'api_sign_up_event.dart';
part 'api_sign_up_state.dart';

class ApiSignUpBloc extends Bloc<ApiSignUpEvent, ApiSignUpState> {
  final SignUpApiRepo signUpApiRepo;
  ApiSignUpBloc({required this.signUpApiRepo}) : super(ApiSignUpInitial()) {
    on<SendData>((event, emit)async {
      emit(ApiSignUpLoading());
     await Future.delayed(const Duration(seconds: 1));
     try {
       await signUpApiRepo.apiSignUp(
        email: event.email,
         password: event.password,
          username: event.userName,
          // context: event.ctx
          ).then((value) {
emit(ApiSignUpLoaded());
       });
     } catch (e) {
       emit(ApiSignUpError(e.toString()));
     }
    });
  }
}
