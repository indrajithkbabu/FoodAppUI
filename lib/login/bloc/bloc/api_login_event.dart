// ignore_for_file: must_be_immutable, sort_constructors_first

part of 'api_login_bloc.dart';

abstract class ApiLoginEvent extends Equatable {
  const ApiLoginEvent();

  @override
  List<Object> get props => [];
}

class LoginSendData extends ApiLoginEvent {
  String email;
  String password;
   BuildContext ctx;
  LoginSendData(this.email,
   this.password,
     this.ctx,
    );
  @override
  List<Object> get props => [];
}
