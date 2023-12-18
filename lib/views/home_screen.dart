import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/db/online/dio_helper.dart';
import 'package:flutter_application_2/models/category_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: DioHelper.dio.get("categories"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.data!.statusCode == 200) {
                  List<CategoryModel> categories = [];
                  for (var element in snapshot.data!.data) {
                    categories.add(CategoryModel.fromJson(element));
                  }

                  return SizedBox(
                    height: 70,
                    child: ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  categories[index].image ?? "",
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            child: Text(categories[index].name ?? ""),
                          ),
                        );
                      },
                      itemCount: categories.length,
                    ),
                  );
                } else {
                  return const Text("Error");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
