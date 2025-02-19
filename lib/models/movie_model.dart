import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  final bool adult;
  final String backdropPath;
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;
  final int id;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  final String overview;
  final double popularity;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  final String title;
  final bool video;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;

  MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
  @override
  String toString() {
    return 'MovieModel{'
        'adult: $adult, '
        'backdropPath: $backdropPath, '
        'genreIds: $genreIds, '
        'id: $id, '
        'originalLanguage: $originalLanguage, '
        'originalTitle: $originalTitle, '
        'overview: $overview, '
        'popularity: $popularity, '
        'posterPath: $posterPath, '
        'releaseDate: $releaseDate, '
        'title: $title, '
        'video: $video, '
        'voteAverage: $voteAverage, '
        'voteCount: $voteCount}';
  }
}
