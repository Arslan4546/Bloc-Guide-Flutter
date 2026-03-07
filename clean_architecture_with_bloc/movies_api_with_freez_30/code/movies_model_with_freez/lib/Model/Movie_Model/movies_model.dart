import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_model.freezed.dart';
part 'movies_model.g.dart';

@freezed
abstract class MoviesModel with _$MoviesModel {
  const factory MoviesModel({
    @Default(0) int total,
    @Default(0) int page,
    @Default(0) int pages,
    @Default([]) @JsonKey(name: 'tv_shows') List<TvShows> tvShow,
  }) = _MoviesModel;

  /// JSON deserialization
  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);
}

@freezed
abstract class TvShows with _$TvShows {
  const factory TvShows({
    @JsonKey(name: 'name') @Default('') String name,
    @Default('') String permalink,
    @Default('') String endDate,
    @Default('') String network,
    @JsonKey(name: 'image_thumbnail_path')
    @Default('')
    String imageThumbnailPath,
    @Default('') String status,
  }) = _TvShows;

  /// JSON deserialization
  factory TvShows.fromJson(Map<String, dynamic> json) =>
      _$TvShowsFromJson(json);
}
