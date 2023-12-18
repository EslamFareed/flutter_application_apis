import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
            const SizedBox(height: 20),
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
            ElevatedButton(
              onPressed: () async {
                try {
                  var response = await Dio().post(
                    "https://api.escuelajs.co/api/v1/users",
                    data: {
                      "name": nameController.text,
                      "email": emailController.text,
                      "password": passwordController.text,
                      "avatar": "https://picsum.photos/800",
                    },
                  );

                  if (response.statusCode == 200 ||
                      response.statusCode == 201) {
                    print("success");
                    print(response.data);
                    Navigator.pop(context);
                  }
                } catch (e) {
                  print(e.toString());
                }
              },
              child: const Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }
}
