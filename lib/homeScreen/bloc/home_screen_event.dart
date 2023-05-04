// ignore_for_file: sort_constructors_first

part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenEvent {}

class NavBarChange extends HomeScreenEvent {
  final int currentInd;
  NavBarChange({required this.currentInd});
}

class PageChange extends HomeScreenEvent{
  final int idx;
  PageChange({required this.idx});
}

class PromoSwitch extends HomeScreenEvent{
  final bool res;
  PromoSwitch({required this.res});
}
class PromoWhatsappSwitch extends HomeScreenEvent{
  final bool res;
  PromoWhatsappSwitch({required this.res});
}

class SocialPushSwitch extends HomeScreenEvent{
  final bool res;
  SocialPushSwitch({required this.res});
}
class OrderPushSwitch extends HomeScreenEvent{
  final bool res;
 OrderPushSwitch({required this.res});
}
class OrderWhatsappSwitch extends HomeScreenEvent{
  final bool res;
 OrderWhatsappSwitch({required this.res});
}
class EnableAllSwitch extends HomeScreenEvent{
  final bool promoPushRes;
  final bool promoWhatsappRes;
  final bool socialPushRes;
  final bool orderPushRes;
  final bool orderWhatsappRes;
  final bool res;
 EnableAllSwitch({
  required this.res,
  required this.promoPushRes,
  required this.promoWhatsappRes,
  required this.socialPushRes,
  required this.orderPushRes,
  required this.orderWhatsappRes,
  });
}
class DropDownGender extends HomeScreenEvent{
  final String genderRes;
  DropDownGender({required this.genderRes});
}

class VegSwitch extends HomeScreenEvent{
  final bool res;
  VegSwitch({required this.res });
}

class NonVegSwitch extends HomeScreenEvent{
  final bool res;
 NonVegSwitch ({required this.res });
}
