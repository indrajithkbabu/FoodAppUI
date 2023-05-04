// ignore_for_file: require_trailing_commas, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/bloc/api_home_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/bloc/cart_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/home_screen_bloc.dart';
import 'package:foodieapp/homeScreen/repo/address_repo.dart';
import 'package:foodieapp/homeScreen/repo/home_repo.dart';
import 'package:foodieapp/homeScreen/repo/orders_repo.dart';
import 'package:foodieapp/homeScreen/repo/recommended_dishes.dart';
import 'package:foodieapp/homeScreen/repo/repository.dart';
import 'package:foodieapp/homeScreen/repo/transaction_repo.dart';
import 'package:foodieapp/homeScreen/view/screens/screen_home.dart';
import 'package:foodieapp/l10n/l10n.dart';
import 'package:foodieapp/login/bloc/bloc/api_login_bloc.dart';
import 'package:foodieapp/login/bloc/login_bloc.dart';
import 'package:foodieapp/login/repo/api_login_repo.dart';
import 'package:foodieapp/login/view/screens/screenLogin.dart';
import 'package:foodieapp/signUp/bloc/bloc/api_sign_up_bloc.dart';
import 'package:foodieapp/signUp/bloc/sign_up_bloc.dart';
import 'package:foodieapp/signUp/repo/api_repository.dart';
import 'package:foodieapp/utils/sharedpref.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DemoRepository(),
        ),
        RepositoryProvider(
          create: (context) => SignUpApiRepo(),
        ),
        RepositoryProvider(
          create: (context) => ApiLoginRepo(),
        ),
        RepositoryProvider(
          create: (context) => ApiHomeRepo(),
        ),
        RepositoryProvider(create: (context) => AddressRepository(),),
         RepositoryProvider(create: (context) => TransactionRepository(),),
          RepositoryProvider(create: (context) => OrdersRepository(),),
          RepositoryProvider(create: (context) => RecommendedDishesRepository (),)
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(),
          ),
          BlocProvider<ApiLoginBloc>(
            create: (context) => ApiLoginBloc(
                apiLoginRepo: RepositoryProvider.of<ApiLoginRepo>(context)),
          ),
          BlocProvider<SignUpBloc>(
            create: (context) => SignUpBloc(),
          ),
          BlocProvider<ApiSignUpBloc>(
            create: (context) => ApiSignUpBloc(
                signUpApiRepo: RepositoryProvider.of<SignUpApiRepo>(context)),
          ),
          BlocProvider<HomeScreenBloc>(
            create: (context) => HomeScreenBloc(),
          ),
          BlocProvider<CartBloc>(
            create: (context) => CartBloc(),
          ),

          BlocProvider<ApiHomeBloc>(
            create: (context) => ApiHomeBloc(
                apiHomeRepo: RepositoryProvider.of<ApiHomeRepo>(context),
                addressRepository: RepositoryProvider.of<AddressRepository>(context),
                transactionRepository: RepositoryProvider.of<TransactionRepository>(context),
                ordersRepository:  RepositoryProvider.of<OrdersRepository>(context),
                recommendedDishesRepository: RepositoryProvider.of<RecommendedDishesRepository >(context)
                ),
          ),

          // BlocProvider(create: (context) => DemoUserBloc(
          //   RepositoryProvider.of<DemoRepository>(context),
          // )..add(LoadDemoUser()),)
        ],
        child: Sizer(
          builder: (
            BuildContext context,
            Orientation orientation,
            DeviceType deviceType,
          ) {
            return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                home: 
                FutureBuilder<String?>(
                  future: getToken(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != '') {
                      // debugPrint("Rebuild token");
                      //  print(snapshot.data);
                      return ScreenHome();
                    } else {
                      return ScreenLogin();
                    }
                  },
                )
                // ScreenLogin(),
                );
          },
        ),
      ),
    );
  }
}

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Sizer(
//       builder: (context, orientation, deviceType) {
//         return MultiRepositoryProvider(
//             providers: [
//               RepositoryProvider(
//                 create: (context) => DemoApiLoginRepo(),
//               ),
//               RepositoryProvider(
//                 create: (context) => DemoApiHomeRepo(),
//               )
//             ],
//             child: BlocProvider(
//               create: (context) => DemoApiHomeBloc(
//                 RepositoryProvider.of<DemoApiHomeRepo>(context)
//               ),
//               child: MaterialApp(
//                   theme: ThemeData(
//                     appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
//                     colorScheme: ColorScheme.fromSwatch(
//                       accentColor: const Color(0xFF13B9FF),
//                     ),
//                   ),
//                   localizationsDelegates:
//                       AppLocalizations.localizationsDelegates,
//                   supportedLocales: AppLocalizations.supportedLocales,
//                   home: FutureBuilder<String?>(
//                     future: getToken(),
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData && snapshot.data != '') {
//                         // debugPrint("Rebuild token");
//                         //  print(snapshot.data);
//                         return DemoHomeUI();
//                       } else {
//                         return DemoLogin();
//                       }
//                     },
//                   )
//                   // DemoSignUp()
//                   //  DemoLogin()
//                   // DummyHome()
//                   // ScreenPost(),
//                   ),
//             ));

       
//       },
//     );
//   }
// }
