part of 'viewcart_bloc.dart';
 class ViewcartState extends Equatable {
  List<DishDetail> dataList;
   bool isVeg ;
  bool isNonVeg ;
   ViewcartState({required this.dataList,required this.isVeg,required this.isNonVeg});
  
  @override
  List<Object> get props => [dataList];
}

class ViewcartInitial extends ViewcartState {
  
  ViewcartInitial():super(dataList: [],isVeg: false,isNonVeg: false);
  
}
