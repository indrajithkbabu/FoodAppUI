part of 'api_home_bloc.dart';

abstract class ApiHomeState extends Equatable {
}

//home data loading
class ApiHomeLoading extends ApiHomeState {
  @override
  List<Object> get props => [];
}
//home data loaded
class ApiHomeLoaded extends ApiHomeState{
  final HomeApiModel result;
ApiHomeLoaded(this.result);
  @override

  List<Object?> get props => [result];

}

//home data error
class ApiHomeError extends ApiHomeState {
  String err;
  ApiHomeError(this.err);
  @override
  List<Object> get props => [err];
}
//address loading
class AddressBookLoading extends ApiHomeState{
   @override
  List<Object> get props => [];

}
//address loaded
class AddressBookLoaded extends ApiHomeState{
  final AddAddressModel res;
  AddressBookLoaded(this.res);
   @override
  List<Object> get props => [res];
}

//address error
class AddressBookError extends ApiHomeState{
  @override
  List<Object> get props => [];
}

//transaction data loading
class TransactionLoading extends ApiHomeState{
   @override
  List<Object> get props => [];
}

//transaction data loaded
class TransactionLoaded extends ApiHomeState{
  final TransactionModel res;
  TransactionLoaded(this.res);
   @override
  List<Object> get props => [res];
}
//transaction data error
class TransactionError extends ApiHomeState{
   @override
  List<Object> get props => [];
}
//orders data loading
class OrdersLoadingData extends ApiHomeState{
   @override
  List<Object> get props => [];
}

//orders data loaded
class OrdersLoadedData extends ApiHomeState{
  final OrdersModel res;
  OrdersLoadedData(this.res);
   @override
  List<Object> get props => [res];
}

//orders data error
class OrdersError extends ApiHomeState{
   @override
  List<Object> get props => [];
}

//selected resto details loading
class RecommendedDishDataLoading extends ApiHomeState{
   @override
  List<Object> get props => [];
}
//selected resto details loaded
class RecommendedDishDataLoaded extends ApiHomeState{
  final RecommendedDishesModel result;
  RecommendedDishDataLoaded(this.result);
   @override
  List<Object> get props => [result];
}
//selected resto details loading Error
class RecommendedDishDataError extends ApiHomeState{
   @override
  List<Object> get props => [];
}
