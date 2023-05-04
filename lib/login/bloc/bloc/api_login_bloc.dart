import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:foodieapp/login/repo/api_login_repo.dart';

part 'api_login_event.dart';
part 'api_login_state.dart';

class ApiLoginBloc extends Bloc<ApiLoginEvent, ApiLoginState> {
  final ApiLoginRepo apiLoginRepo;
  ApiLoginBloc({required this.apiLoginRepo}) : super(ApiLoginInitial()) {
    on<LoginSendData>((event, emit) async {
      emit(ApiLoginLoading());
      await Future.delayed(const Duration(microseconds: 1));
      try {
        await apiLoginRepo
            .apiLogin(
                email: event.email,
                password: event.password,
                 context: event.ctx,
                )
            .then((value) {
          emit(ApiLoginloaded());
        });
      } catch (e) {
        emit(ApiLoginErr(e.toString()));
      }
    },
    
    
    );
   
  }
}
