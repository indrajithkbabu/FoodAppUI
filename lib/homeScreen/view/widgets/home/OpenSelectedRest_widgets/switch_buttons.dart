import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/bloc/viewcart_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/home_screen_bloc.dart';
import 'package:foodieapp/utils/constants.dart';

class SwitchVegNon extends StatelessWidget {
  const SwitchVegNon({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                    children: [
                      Transform.scale(
                        scale: 1,
                        child: BlocBuilder<ViewcartBloc, ViewcartState>(
                          builder: (context, state) {
                            return Switch(
                              activeThumbImage: const AssetImage(
                                'assets/images/vegIcon.png',
                              ),
                              inactiveThumbImage: const AssetImage(
                                'assets/images/veg.png',
                              ),
                              value: state.isVeg,
                              activeColor: const Color(0xFF1D9F80),
                              onChanged: (value) {
                                context
                                    .read<HomeScreenBloc>()
                                    .add(VegSwitch(res: value));
                              },
                            );
                          },
                        ),
                      ),
                      Transform.scale(
                        scale: 1,
                        child: BlocBuilder<ViewcartBloc, ViewcartState>(
                          builder: (context, state) {
                            return Switch(
                              activeThumbImage: const AssetImage(
                                'assets/images/Non veg.png',
                              ),
                              inactiveThumbImage: const AssetImage(
                                'assets/images/nonVegIcon.png',
                              ),
                              value: state.isNonVeg,
                              activeColor: FoodDeliveryColor.logoutButtonColor,
                              onChanged: (value) {
                                context
                                    .read<HomeScreenBloc>()
                                    .add(NonVegSwitch(res: value));
                              },
                            );
                          },
                        ),
                      )
                    ],
                  );
  }
}
