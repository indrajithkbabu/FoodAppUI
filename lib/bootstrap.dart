import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:foodieapp/firebase_options.dart';
import 'package:foodieapp/utils/sharedpref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  // print(getNotification('promoPush'));
// await getNotification('promoPush');
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ignore: unused_local_variable
  SharedPreferences pref;
  pref=await SharedPreferences.getInstance();

  await runZonedGuarded(
    () async => runApp(await builder()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
