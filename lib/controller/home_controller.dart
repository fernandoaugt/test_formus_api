import 'dart:developer';
import 'package:get/get.dart';
import 'package:test_formus_api/models/movie_model.dart';
import 'package:test_formus_api/repository/movie_repository.dart';

class HomeController extends GetxController {
  final movies = <MovieModel>[].obs;
  final homeRespository = MoviesRepository();
  @override
  void onInit() {
    getMovies();
    super.onInit();
  }

  getMovies() async {
    try {
      final result = await homeRespository.getMovies();

      result.when(
          success: (data) {
            movies.assignAll(data);
            log(movies.toList().toString());
          },
          error: (error) {});
    } catch (e) {}
  }
}
