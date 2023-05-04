part of 'api_home_bloc.dart';

abstract class ApiHomeEvent extends Equatable {
  const ApiHomeEvent();

  @override
  List<Object> get props => [];
}
class FetchHomeData extends ApiHomeEvent{
 @override
  List<Object> get props => [];

}

class FetchAddressData extends ApiHomeEvent{
   @override
  List<Object> get props => [];
}

class FetchTransactionData extends ApiHomeEvent{
   @override
  List<Object> get props => [];
}
class FetchOrdersData extends ApiHomeEvent{
   @override
  List<Object> get props => [];
}

class FetchRecommendedDishDetails extends ApiHomeEvent{
   @override
  List<Object> get props => [];
}
