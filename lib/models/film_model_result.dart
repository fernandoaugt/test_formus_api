import 'package:freezed_annotation/freezed_annotation.dart';

part 'film_model_result.freezed.dart';

@freezed
class FilmeResult<T> with _$FilmeResult<T> {
  factory FilmeResult.success(List<T> data) = Success;
  factory FilmeResult.error(String message) = Error;
}
