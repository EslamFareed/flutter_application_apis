import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/db/offline/cache_keys.dart';
import 'package:flutter_application_2/controllers/db/offline/shared_helper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(
          context,
          SharedHelper.prefs.getBool(CacheKeys.isLogin.name) ?? false
              ? 'home'
              : 'login');
    });

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.shop,
              size: 150,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
