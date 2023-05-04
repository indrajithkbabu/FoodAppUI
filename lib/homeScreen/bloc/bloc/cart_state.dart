part of 'cart_bloc.dart';

class CartState extends Equatable {
  List<CartModel> cartDataList;
  CartState({required this.cartDataList});

  @override
  List<Object> get props => [cartDataList];
}

class CartInitial extends CartState {
  CartInitial() : super(cartDataList: []);
}
