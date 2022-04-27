import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'movie_info_entity.g.dart';

@JsonSerializable()
class MovieInfo {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'adult')
  final bool? adult;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;

  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @JsonKey(name: 'original_title')
  final String? originalTitle;

  @JsonKey(name: 'overview')
  final String? overview;

  @JsonKey(name: 'popularity')
  final double? popularity;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'video')
  final bool? isVideo;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final double? voteCount;

  MovieInfo(
      {this.id,
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.isVideo,
      this.voteAverage,
      this.voteCount});

  factory MovieInfo.fromJson(Map<String, dynamic> json) =>
      _$MovieInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieInfoToJson(this);

  String getPosterImage() {
    return 'https://image.tmdb.org/t/p/w500' + posterPath.toString();
  }

  String getBackdropImage() {
    return 'https://image.tmdb.org/t/p/w500' + backdropPath.toString();
  }

  String getFirstGenre() {
    if (genreIds != null) {
      switch (genreIds![0]) {
        case 28: return "Action";
        case 12: return "Adventure";
        case 80: return "Crime";
        case 16: return "Animation";
        case 35: return "Comedy";
        case 99: return "Documentary";
        case 18: return "Drama";
        case 10751: return "Family";
        case 14: return "Fantasy";
        case 36: return "History";
        case 27: return "Horror";
        case 10402: return "Music";
        case 9648: return "Mystery";
        case 10749: return "Romance";
        case 878: return "Science Fiction";
        case 10770: return "TV Movie";
        case 53: return "Thriller";
        case 37: return "Western";
        default: return "Genre";
      }
    }
    return 'N/A';
  }
}
