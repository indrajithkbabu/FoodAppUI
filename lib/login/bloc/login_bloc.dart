import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialState()) {
    on<ShowPassword>((event, emit) {
      final bool onAct = state.onActive;
      return emit(LoginState(onActive: !onAct));
    });
  }
}
