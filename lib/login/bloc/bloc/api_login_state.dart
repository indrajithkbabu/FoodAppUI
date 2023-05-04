part of 'api_login_bloc.dart';

abstract class ApiLoginState extends Equatable {
  const ApiLoginState();
  
  @override
  List<Object> get props => [];
}

class ApiLoginInitial extends ApiLoginState {
  final bool onActive;
  ApiLoginInitial({this.onActive:true});
    @override
  List<Object> get props => [];
}
class ApiLoginLoading extends ApiLoginState {
    @override
  List<Object> get props => [];
}
class ApiLoginloaded extends ApiLoginState {
    @override
  List<Object> get props => [];
}
class ApiLoginErr extends ApiLoginState {
  String err;
  ApiLoginErr(this.err);
    @override
  List<Object> get props => [err];
}
