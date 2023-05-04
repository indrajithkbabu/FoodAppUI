import 'package:bloc/bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(InitialSignUp()) {
    on<ShowPasswd>((event, emit) {
      final bool onAct = state.onActive;
      return emit(SignUpState(onActive: !onAct));
    });
  }
}
