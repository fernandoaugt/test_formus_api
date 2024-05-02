import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_formus_api/models/movie_model.dart';
import 'package:test_formus_api/repository/movie_repository.dart';

class HomeController extends GetxController {
  final movies = <MovieModel>[].obs;
  final foundMovies = <MovieModel>[].obs;
  final homeRespository = MoviesRepository();
  final isloading = false.obs;
  var errorlistMovies = false.obs;

  @override
  void onInit() {
    getMovies();
    super.onInit();
  }

  getMovies() async {
    isloading.value = true;
    final result = await homeRespository.getMovies();

    result.when(success: (data) {
      movies.assignAll(data);
      foundMovies.value = movies.take(10).toList();
      log(movies.toList().toString());
      errorlistMovies.value = false;
    }, error: (error) {
      const snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text('Erro ao recuperar Filmes'),
      );
      errorlistMovies.value = true;
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    });

    isloading.value = false;
  }

  filterMovies({
    required String name,
  }) {
    if (name.isEmpty) {
      foundMovies.value = movies.toList();
      foundMovies.sort(
          (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
    } else {
      var startsWithResults = movies
          .where((element) =>
              element.title.toLowerCase().startsWith(name.toLowerCase()))
          .toList();

      var containsResults = movies
          .where((element) =>
              element.title.toLowerCase().contains(name.toLowerCase()))
          .where((element) => !startsWithResults.contains(element))
          .toList();

      foundMovies.value = [...startsWithResults, ...containsResults];
    }
  }
}
