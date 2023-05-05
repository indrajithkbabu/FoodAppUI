// ignore_for_file: depend_on_referenced_packages, lines_longer_than_80_chars

import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodieapp/utils/sharedpref.dart';

import 'package:meta/meta.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<NavBarChange>(
      (event, emit) {
        return emit(HomeScreenState(
          
            currentIndex: event.currentInd,
            isPromoPush: state.isPromoPush,
            isPromoWhatsapp: state.isPromoWhatsapp,
            isSocialPush: state.isSocialPush,
            isOrdersPush: state.isOrdersPush,
            isOrdersWhatsapp: state.isOrdersWhatsapp,
            isEnableAllSwitch: state.isEnableAllSwitch,
            dropdownvalue: state.dropdownvalue,
        
            ),);
      },
    );

    on<PageChange>(
      (event, emit) {
        return emit(
          HomeScreenState(
              currentIndex: state.currentIndex,
              activeIndex: event.idx,
              isPromoPush: state.isPromoPush,
              isPromoWhatsapp: state.isPromoWhatsapp,
              isSocialPush: state.isSocialPush,
              isOrdersPush: state.isOrdersPush,
              isOrdersWhatsapp: state.isOrdersWhatsapp,
              isEnableAllSwitch: state.isEnableAllSwitch,
              dropdownvalue: state.dropdownvalue,
             ),
        );
      },
    );

    on<PromoSwitch>((event, emit) {
    //   print(event.res);
    //  setNotification('promoPush', event.res);
      if(event.res==true && 
      state.isPromoWhatsapp==true && 
      state.isSocialPush==true &&
      state.isOrdersPush==true &&
      state.isOrdersWhatsapp==true
      ){
        emit(HomeScreenState(
          currentIndex: state.currentIndex,
          isPromoPush: event.res,
          isPromoWhatsapp: state.isPromoWhatsapp,
          isSocialPush: state.isSocialPush,
          isOrdersPush: state.isOrdersPush,
          isOrdersWhatsapp: state.isOrdersWhatsapp,
          isEnableAllSwitch: true,
          dropdownvalue: state.dropdownvalue,
         ),);
      }
      if(event.res ==false){
         emit(HomeScreenState(
          currentIndex: state.currentIndex,
          isPromoPush: event.res,
          isPromoWhatsapp: state.isPromoWhatsapp,
          isSocialPush: state.isSocialPush,
          isOrdersPush: state.isOrdersPush,
          isOrdersWhatsapp: state.isOrdersWhatsapp,
          isEnableAllSwitch: false,
          dropdownvalue: state.dropdownvalue,
         ),);
      }else{
emit(HomeScreenState(
          currentIndex: state.currentIndex,
          isPromoPush: event.res,
          isPromoWhatsapp: state.isPromoWhatsapp,
          isSocialPush: state.isSocialPush,
          isOrdersPush: state.isOrdersPush,
          isOrdersWhatsapp: state.isOrdersWhatsapp,
          isEnableAllSwitch: state.isEnableAllSwitch,
          dropdownvalue: state.dropdownvalue,
        ),);
      }
      
    });

    on<PromoWhatsappSwitch>((event, emit) {
       if(event.res==true && 
      state.isPromoPush==true && 
      state.isSocialPush==true &&
      state.isOrdersPush==true &&
      state.isOrdersWhatsapp==true
      ){
        emit(HomeScreenState(
          currentIndex: state.currentIndex,
          isPromoPush:state.isPromoPush ,
          isPromoWhatsapp: event.res,
          isSocialPush: state.isSocialPush,
          isOrdersPush: state.isOrdersPush,
          isOrdersWhatsapp: state.isOrdersWhatsapp,
          isEnableAllSwitch: true,
          dropdownvalue: state.dropdownvalue,
         ),);
      }
      if(event.res==false){
        emit(HomeScreenState(
          currentIndex: state.currentIndex,
          isPromoPush: state.isPromoPush,
          isPromoWhatsapp: event.res,
          isSocialPush: state.isSocialPush,
          isOrdersPush: state.isOrdersPush,
          isOrdersWhatsapp: state.isOrdersWhatsapp,
          isEnableAllSwitch: false,
          dropdownvalue: state.dropdownvalue,
          
          ),);
      }else{
emit(HomeScreenState(
          currentIndex: state.currentIndex,
          isPromoPush: state.isPromoPush,
          isPromoWhatsapp: event.res,
          isSocialPush: state.isSocialPush,
          isOrdersPush: state.isOrdersPush,
          isOrdersWhatsapp: state.isOrdersWhatsapp,
          isEnableAllSwitch: state.isEnableAllSwitch,
          dropdownvalue: state.dropdownvalue,
         
          ),);
      }
     
    });
    on<SocialPushSwitch>((event, emit) {
       if(event.res==true && 
      state.isPromoPush==true && 
      state.isPromoWhatsapp==true &&
      state.isOrdersPush==true &&
      state.isOrdersWhatsapp==true
      ){
        emit(HomeScreenState(
          currentIndex: state.currentIndex,
          isPromoPush:state.isPromoPush ,
          isPromoWhatsapp: state.isPromoWhatsapp,
          isSocialPush: event.res,
          isOrdersPush: state.isOrdersPush,
          isOrdersWhatsapp: state.isOrdersWhatsapp,
          isEnableAllSwitch: true,
          dropdownvalue: state.dropdownvalue,
         ),);
      }
      if(event.res==false){
         emit(HomeScreenState(
          currentIndex: state.currentIndex,
          isPromoPush: state.isPromoPush,
          isPromoWhatsapp: state.isPromoWhatsapp,
          isSocialPush: event.res,
          isOrdersPush: state.isOrdersPush,
          isOrdersWhatsapp: state.isOrdersWhatsapp,
          isEnableAllSwitch: false,
          dropdownvalue: state.dropdownvalue,
         
          ),);
      }else{
         emit(HomeScreenState(
          currentIndex: state.currentIndex,
          isPromoPush: state.isPromoPush,
          isPromoWhatsapp: state.isPromoWhatsapp,
          isSocialPush: event.res,
          isOrdersPush: state.isOrdersPush,
          isOrdersWhatsapp: state.isOrdersWhatsapp,
          isEnableAllSwitch: state.isEnableAllSwitch,
          dropdownvalue: state.dropdownvalue,
       
          ),);
      }
      
    });

    on<OrderPushSwitch>((event, emit) {
      if(event.res==true && 
      state.isPromoPush==true && 
      state.isPromoWhatsapp==true &&
      state.isSocialPush==true &&
      state.isOrdersWhatsapp==true
      ){
        emit(HomeScreenState(
          currentIndex: state.currentIndex,
          isPromoPush:state.isPromoPush ,
          isPromoWhatsapp: state.isPromoWhatsapp,
          isSocialPush: event.res,
          isOrdersPush: state.isOrdersPush,
          isOrdersWhatsapp: state.isOrdersWhatsapp,
          isEnableAllSwitch: true,
          dropdownvalue: state.dropdownvalue,
         ),);
      }
      if(event.res==false){
         emit(HomeScreenState(
          currentIndex: state.currentIndex,
          isPromoPush: state.isPromoPush,
          isPromoWhatsapp: state.isPromoWhatsapp,
          isSocialPush: state.isSocialPush,
          isOrdersPush: event.res,
          isOrdersWhatsapp: state.isOrdersWhatsapp,
          isEnableAllSwitch: false,
          dropdownvalue: state.dropdownvalue,
          ),);
      }else{
          emit(HomeScreenState(
          currentIndex: state.currentIndex,
          isPromoPush: state.isPromoPush,
          isPromoWhatsapp: state.isPromoWhatsapp,
          isSocialPush: state.isSocialPush,
          isOrdersPush: event.res,
          isOrdersWhatsapp: state.isOrdersWhatsapp,
          isEnableAllSwitch: state.isEnableAllSwitch,dropdownvalue: state.dropdownvalue),);
      }
      
    });

    on<OrderWhatsappSwitch>((event, emit) {
      if(event.res==true && 
      state.isPromoPush==true && 
      state.isPromoWhatsapp==true &&
      state.isSocialPush==true &&
      state.isOrdersPush==true
      ){
        emit(HomeScreenState(
          currentIndex: state.currentIndex,
          isPromoPush:state.isPromoPush ,
          isPromoWhatsapp: state.isPromoWhatsapp,
          isSocialPush: state.isSocialPush,
          isOrdersPush: state.isOrdersPush,
          isOrdersWhatsapp: event.res,
          isEnableAllSwitch: true,
          dropdownvalue: state.dropdownvalue,
       ),);
      }

      if(event.res==false){
         return emit(HomeScreenState(
          currentIndex: state.currentIndex,
          isPromoPush: state.isPromoPush,
          isPromoWhatsapp: state.isPromoWhatsapp,
          isSocialPush: state.isSocialPush,
          isOrdersPush: state.isOrdersPush,
          isOrdersWhatsapp: event.res,
          isEnableAllSwitch: false,
          dropdownvalue: state.dropdownvalue,
        
          ),);
      }else{
         return emit(HomeScreenState(
          currentIndex: state.currentIndex,
          isPromoPush: state.isPromoPush,
          isPromoWhatsapp: state.isPromoWhatsapp,
          isSocialPush: state.isSocialPush,
          isOrdersPush: state.isOrdersPush,
          isOrdersWhatsapp: event.res,
          isEnableAllSwitch: state.isEnableAllSwitch,
          dropdownvalue: state.dropdownvalue,
          
          ),);
      }
     
    });

    on<EnableAllSwitch>((event, emit) {
      return emit(HomeScreenState(
        currentIndex: state.currentIndex,
        isPromoPush: event.promoPushRes,
        isPromoWhatsapp: event.promoWhatsappRes,
        isSocialPush: event.socialPushRes,
        isOrdersPush: event.orderPushRes,
        isOrdersWhatsapp: event.orderWhatsappRes,
        isEnableAllSwitch: event.res,
        dropdownvalue: state.dropdownvalue,
    
      ),);
    });
  on<DropDownGender>((event, emit) {
      return emit(HomeScreenState(
        currentIndex: state.currentIndex,
        isPromoPush: state.isPromoPush,
        isPromoWhatsapp: state.isPromoWhatsapp,
        isSocialPush: state.isSocialPush,
        isOrdersPush: state.isOrdersPush,
        isOrdersWhatsapp: state.isOrdersWhatsapp,
        isEnableAllSwitch: state.isEnableAllSwitch,
        dropdownvalue: event.genderRes,
   
      ),);
    });

    on<VegSwitch>((event, emit) {
      // print(event.res);
  return emit(HomeScreenState(
        currentIndex: state.currentIndex,
        isPromoPush: state.isPromoPush,
        isPromoWhatsapp: state.isPromoWhatsapp,
        isSocialPush: state.isSocialPush,
        isOrdersPush: state.isOrdersPush,
        isOrdersWhatsapp: state.isOrdersWhatsapp,
        isEnableAllSwitch: state.isEnableAllSwitch,
        dropdownvalue: state.dropdownvalue,
      
      ),);
    });
     on<NonVegSwitch>((event, emit) {
 return emit(HomeScreenState(
        currentIndex: state.currentIndex,
        isPromoPush: state.isPromoPush,
        isPromoWhatsapp: state.isPromoWhatsapp,
        isSocialPush: state.isSocialPush,
        isOrdersPush: state.isOrdersPush,
        isOrdersWhatsapp: state.isOrdersWhatsapp,
        isEnableAllSwitch: state.isEnableAllSwitch,
        dropdownvalue: state.dropdownvalue,
   
      ),);
    });

  }
}
