import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_formus_api/controller/home_controller.dart';
import 'package:test_formus_api/view/components/movie_list_tile.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() => SingleChildScrollView(
            child: Column(
              children: List.generate(
                  homeController.movies.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MovieListTile(
                          movieModel: homeController.movies[index],
                        ),
                      )),
            ),
          )),
    );
  }
}
