import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodieapp/homeScreen/view/model/recommended_dishes.dart';

part 'viewcart_event.dart';
part 'viewcart_state.dart';

class ViewcartBloc extends Bloc<ViewcartEvent, ViewcartState> {
  ViewcartBloc() : super(ViewcartInitial()) {
    on<FetchAllData>((event, emit) {
      print(event.dataList);
      emit(ViewcartState(
          dataList: event.dataList,
          isVeg: state.isVeg,
          isNonVeg: state.isNonVeg));
    });
    on<FilterListEvent>((event, emit) {
      List<DishDetail> fullMenuList = state.dataList;
      List<DishDetail> filterVegNonList = [];
      if (event.isVeg == true && event.isNonVeg == false) {
        filterVegNonList = fullMenuList
            .where(
              (e) => e.vegStatus.contains('true'),
            )
            .toList();
      } else if (event.isVeg == false && event.isNonVeg == true) {
        filterVegNonList = fullMenuList
            .where(
              (e) => e.vegStatus.contains('false'),
            )
            .toList();
      } else {
        filterVegNonList = fullMenuList;
      }
      emit(ViewcartState(dataList: filterVegNonList, isVeg: event.isVeg, isNonVeg: event.isNonVeg));
    });
  }
}
