import 'dart:developer';

import 'package:test_formus_api/helper/endpoints.dart';
import 'package:test_formus_api/services/http_manager.dart';

class FilmManager {
  final HttpManager _httpManager = HttpManager();

  Future<bool> getFilms() async {
    final result = await _httpManager.restRequest(
      url: "${Endpoints.getFilms}/25",
      method: HttpMethods.get,
      body: {},
    );

    log("${result.toString()}");

    return result['error'] == null;
  }
}
