import 'package:test_formus_api/helper/endpoints.dart';
import 'package:test_formus_api/models/movie_model.dart';
import 'package:test_formus_api/models/movie_model_result.dart';
import 'package:test_formus_api/services/http_manager.dart';

class MoviesRepository {
  final HttpManager _httpManager = HttpManager();

  Future<MovieResult<MovieModel>> getMovies() async {
    final result = await _httpManager.restRequest(
      url:
          "${Endpoints.getFilms}?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc",
      method: HttpMethods.get,
      body: {},
    );

    if (result["results"] != null) {
      List<MovieModel> data =
          (List<Map<String, dynamic>>.from(result["results"]))
              .map(MovieModel.fromJson)
              .toList();

      return MovieResult<MovieModel>.success(data);
    } else {
      return MovieResult.error("Erro ao recuperar Filmes");
    }
  }
}
