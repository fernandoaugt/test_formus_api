import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model_result.freezed.dart';

@freezed
class MovieResult<T> with _$MovieResult<T> {
  factory MovieResult.success(List<T> data) = Success;
  factory MovieResult.error(String message) = Error;
}
