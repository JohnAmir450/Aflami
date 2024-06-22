import 'package:aflami/core/di/di_setup.dart';
import 'package:aflami/core/helpers/bloc_observer.dart';
import 'package:aflami/core/helpers/cache_helper.dart';
import 'package:aflami/core/helpers/cahce_keys.dart';
import 'package:aflami/core/networking/api_service.dart';
import 'package:aflami/core/routing/app_router.dart';
import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  diSetup();
  await ApiService.init();
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();
await CacheHelper.init();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        
        title: 'Aflami',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff0A071E),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: _getInitialRoute(),
      ),
    );
  }
  String _getInitialRoute() {
    bool? isLoggedIn = CacheHelper.getData(key: CacheKeys.loginKey) as bool?;
    bool? isRegistered =
        CacheHelper.getData(key: CacheKeys.registerKey) as bool?;

    if (isLoggedIn == true || isRegistered == true) {
      return Routes.homeScreen;
    } else {
      return Routes.loginScreen;
    }
  }
}
