import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/db/offline/shared_helper.dart';
import 'package:flutter_application_2/controllers/db/online/dio_helper.dart';
import 'package:flutter_application_2/views/create_account_screen.dart';
import 'package:flutter_application_2/views/home_screen.dart';
import 'package:flutter_application_2/views/login_screen.dart';
import 'package:flutter_application_2/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedHelper.init();
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        "splash": (ctx) => const SplashScreen(),
        "login": (ctx) => LoginScreen(),
        "home": (ctx) => const HomeScreen(),
        "createAccount": (ctx) => CreateAccountScreen(),
      },
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.cyan,
          titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}

//! Login
//! Create Account
//! Home Screen ( Categories Hor - Products Grid View)
//! Search (filter products)

