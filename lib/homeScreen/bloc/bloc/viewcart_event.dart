// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'viewcart_bloc.dart';

abstract class ViewcartEvent extends Equatable {
  const ViewcartEvent();

  @override
  List<Object> get props => [];
}
class FetchAllData extends ViewcartEvent {
   List<DishDetail> dataList;
   FetchAllData({required this.dataList});
     @override
  List<Object> get props => [dataList];
}
class FilterListEvent extends ViewcartEvent {
bool isVeg ;
bool isNonVeg;
  FilterListEvent({
    required this.isVeg,
    required this.isNonVeg,
  });
    @override
  List<Object> get props => [isVeg, isNonVeg];
}
