// ignore_for_file: must_be_immutable, sort_constructors_first

part of 'api_sign_up_bloc.dart';

abstract class ApiSignUpState extends Equatable {
  const ApiSignUpState();
  
  @override
  List<Object> get props => [];
}

class ApiSignUpInitial extends ApiSignUpState {}

class ApiSignUpLoading extends ApiSignUpState{
  @override
  List<Object> get props => [];
}

class ApiSignUpLoaded extends ApiSignUpState{
   @override
  List<Object> get props => [];
}
class ApiSignUpError extends ApiSignUpState{
  String err;
  ApiSignUpError(this.err);
   @override
  List<Object> get props => [err];
}
