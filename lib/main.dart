import 'package:airplane_2/cubit/auth_cubit.dart';
import 'package:airplane_2/cubit/page_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:airplane_2/ui/pages/main_page.dart';
import 'package:airplane_2/ui/pages/bonus_page.dart';
import 'package:airplane_2/ui/pages/splash_page.dart';
import 'package:airplane_2/ui/pages/get_started_page.dart';
import 'package:airplane_2/ui/pages/sign_up_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
        '/': (context) => const SplashPage(),
        '/get-started': (context) => const GetStartedPage(),
        '/sign-up': (context) => SignUpPage(),
        '/bonus-page': (context) => const BonusPage(),
        '/main': (context) => const MainPage(),
      }),
    );
  }
}
