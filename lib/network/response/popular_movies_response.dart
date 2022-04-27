import 'package:ducnm_flutter_sample1/network/entity/movie_info_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_movies_response.g.dart';

@JsonSerializable()
class PopularMoviesResponse {
  @JsonKey(name: 'results')
  final List<MovieInfo> results;

  @JsonKey(name: 'page')
  final int? page;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  PopularMoviesResponse(this.results, this.page, this.totalPages);

  factory PopularMoviesResponse.fromJson(Map<String, dynamic> json) => _$PopularMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesResponseToJson(this);
}