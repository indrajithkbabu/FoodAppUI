// ignore_for_file: sort_constructors_first, lines_longer_than_80_chars, always_put_required_named_parameters_first, type_annotate_public_apis

part of 'home_screen_bloc.dart';

class HomeScreenState {
int? activeIndex;

  int currentIndex;
 final bool isPromoPush;
 final bool isPromoWhatsapp;
 final bool isSocialPush;
 bool isOrdersPush ;
   bool isOrdersWhatsapp;
   bool isEnableAllSwitch;
   String dropdownvalue ;

  var items = [
    'Male',
    'Female',
  ];
  HomeScreenState({
    required this.currentIndex,
    this.activeIndex,
    required this.isPromoPush,
    required this.isPromoWhatsapp,
    required this.isSocialPush,
    required this.isOrdersPush,
    required this.isOrdersWhatsapp,
    required this.isEnableAllSwitch,
    required this.dropdownvalue,
  
    });
}

class HomeScreenInitial extends HomeScreenState {
  HomeScreenInitial() : super(currentIndex: 0,
  activeIndex: 0,
  isPromoPush: true,
  isPromoWhatsapp: true,
  isSocialPush: true,
  isOrdersPush: true,
  isOrdersWhatsapp: true,
  isEnableAllSwitch: true,
  dropdownvalue: 'Male',
 
  );
}
