import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/db/offline/cache_keys.dart';
import 'package:flutter_application_2/controllers/db/offline/shared_helper.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
            const SizedBox(height: 50),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        var response = await Dio().post(
                          "https://api.escuelajs.co/api/v1/auth/login",
                          data: {
                            "email": emailController.text,
                            "password": passwordController.text
                          },
                        );

                        if (response.statusCode == 201) {
                          print("success");
                          print(response.data);

                          await SharedHelper.prefs.setString(
                            CacheKeys.token.name,
                            response.data["access_token"],
                          );
                          await SharedHelper.prefs
                              .setBool(CacheKeys.isLogin.name, true);

                          Navigator.pushReplacementNamed(context, 'home');
                        }
                      } catch (e) {
                        print(e.toString());
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: const Text("Login"),
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'createAccount');
              },
              child: const Text("Create Account"),
            )
          ],
        ),
      ),
    );
  }
}
