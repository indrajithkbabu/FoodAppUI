// ignore_for_file: sort_constructors_first, prefer_const_constructors_in_immutables, lines_longer_than_80_chars

part of 'api_sign_up_bloc.dart';

abstract class ApiSignUpEvent extends Equatable {
  const ApiSignUpEvent();

  @override
  List<Object> get props => [];
}
class SendData extends ApiSignUpEvent{
   final String userName;
  final String email;
  final String password;
  //  BuildContext ctx;
 SendData(
  this.userName,
   this.email,
    this.password,
    // this.ctx
    );
}
