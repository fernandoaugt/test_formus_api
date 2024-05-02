import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_formus_api/controller/home_controller.dart';
import 'package:test_formus_api/helper/constants.dart';
import 'package:test_formus_api/view/home/components/error_empyt.dart';
import 'package:test_formus_api/view/home/components/movie_list_tile.dart';
import 'package:test_formus_api/view/home/components/search_field.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Formus Filmes",
          style: TextStyle(color: Constants.fontColor),
        ),
        backgroundColor: Constants.backgroundColor,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(() => Center(
                  child: Visibility(
                visible: homeController.isloading.value,
                replacement: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Olá, Como vai?",
                      style: TextStyle(
                          color: Constants.fontColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (homeController.errorlistMovies.value) ...[
                      ErrorEmpyt(
                        onPressed: () {
                          homeController.getMovies();
                        },
                      )
                    ] else ...[
                      SearchField(
                        onChanged: (v) {
                          homeController.filterMovies(name: v);
                        },
                        labelText: 'Procure um conteúdo',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Top 10",
                        style: TextStyle(
                            color: Constants.fontColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ...List.generate(
                                      homeController.foundMovies.length,
                                      (index) => MovieListTile(
                                            movie: homeController
                                                .foundMovies[index],
                                          )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
                child: CircularProgressIndicator(
                  color: Constants.suportFontColor,
                ),
              )))),
    );
  }
}
