part of 'api_demo_bloc.dart';

 class ApiDemoState extends Equatable {
  const ApiDemoState({required this.isApiLoading,this.result});
  final bool isApiLoading;
  final DataModel? result;
  
  @override
  List<dynamic> get props => [isApiLoading,result];
}

class ApiDemoInitial extends ApiDemoState {
 const ApiDemoInitial({required super.isApiLoading});
}
