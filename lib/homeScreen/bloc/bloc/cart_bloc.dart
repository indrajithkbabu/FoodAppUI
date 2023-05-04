import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodieapp/homeScreen/view/model/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    final Map<String, CartModel> _cartData = {};
    // List<CartModel> blocartDataList=state.cartDataList;
    
    on<CartFirstIncrementItem>((event, emit) {

      if(event is CartFirstIncrementItem){
        if(_cartData.containsKey(event.res.id.toString())){
          _cartData[event.res.id.toString()]!.quantity++;
     
        }else{
          _cartData[event.res.id.toString()] = event.res;
        
        }
      }
        //   final List<CartModel> updatedCartDataList =
        // List.from(state.cartDataList)..add(event.res);
        print(_cartData.values.toList());
    
      return emit(CartState(cartDataList:_cartData.values.toList()));
    });


    
    // on<isExpandEvent>((event, emit){
    //    print(event.res);

    //   emit(CartState(cartData: state.cartData, isExpand: event.res));

    // });
  }
}
