import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodieapp/homeScreen/repo/address_repo.dart';
import 'package:foodieapp/homeScreen/repo/home_repo.dart';
import 'package:foodieapp/homeScreen/repo/orders_repo.dart';
import 'package:foodieapp/homeScreen/repo/recommended_dishes.dart';
import 'package:foodieapp/homeScreen/repo/transaction_repo.dart';
import 'package:foodieapp/homeScreen/view/model/add_address_model.dart';
import 'package:foodieapp/homeScreen/view/model/api_home_model.dart';
import 'package:foodieapp/homeScreen/view/model/orders_model.dart';
import 'package:foodieapp/homeScreen/view/model/recommended_dishes.dart';
import 'package:foodieapp/homeScreen/view/model/transaction_model.dart';

part 'api_home_event.dart';
part 'api_home_state.dart';

class ApiHomeBloc extends Bloc<ApiHomeEvent, ApiHomeState> {
  final ApiHomeRepo apiHomeRepo;
  final AddressRepository addressRepository;
  final TransactionRepository transactionRepository;
  final OrdersRepository ordersRepository;
  final RecommendedDishesRepository recommendedDishesRepository;
  ApiHomeBloc({required this.apiHomeRepo,
  required this.addressRepository,
  required this.transactionRepository,
  required this.ordersRepository,
  required this.recommendedDishesRepository,
  }) : super(ApiHomeLoading()) {
    on<FetchHomeData>((event, emit)async {
       emit(ApiHomeLoading());
       await Future<void>.delayed(const Duration(microseconds:1));
      try {
        print("apiLoading");
     final result=await apiHomeRepo.apiHomeInn();
     print("apiLoaded");
     emit(ApiHomeLoaded(result));
   } catch (e) {
   throw Exception(e);
      
   }
     
    });

    on<FetchAddressData>((event, emit)async {
       emit(AddressBookLoading());
      await Future<void>.delayed(const Duration(microseconds:1));
      try {
        final res=await addressRepository.addressData();
        emit(AddressBookLoaded(res));
      } catch (e) {
         throw Exception(e);
      }

    });

    on<FetchTransactionData>((event, emit)async {
       emit(TransactionLoading());
      await Future.delayed(const Duration(microseconds:1));
      try {
        final res=await transactionRepository.transactionData();
        emit(TransactionLoaded(res));
      } catch (e) {
         throw Exception(e); 
      }

    });

    on<FetchOrdersData>((event, emit)async {
       emit(OrdersLoadingData());
      await Future.delayed(const Duration(microseconds:1));
      try {
        final res=await ordersRepository.ordersData();
        emit(OrdersLoadedData(res));
      } catch (e) {
         throw Exception(e); 
      }

    });

    on<FetchRecommendedDishDetails>((event, emit) async {
      emit(RecommendedDishDataLoading());
  await Future.delayed(const Duration(microseconds:1));
  try {
    final res=await recommendedDishesRepository.recommendedDishData();
    emit(RecommendedDishDataLoaded(res));
  } catch (e) {
    throw Exception(e);
  }


    });

   
  }
}
