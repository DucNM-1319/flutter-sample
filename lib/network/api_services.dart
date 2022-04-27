import 'package:dio/dio.dart';
import 'package:ducnm_flutter_sample1/network/response/popular_movies_response.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

// done this file

@RestApi(baseUrl:'https://api.themoviedb.org/3/movie')
abstract class ApiServices {

  static const API_KEY = '404a4509640641bf8ab5b1de0e4592f6';
  static const LANGUAGE = 'en-US';

  factory ApiServices(Dio dio) = _ApiServices;

  // Login service
  @GET('/popular') // enter your api method
  Future<PopularMoviesResponse> getPopularMovies (@Query('api_key') String apiKey, @Query('language') String language, @Query('page') int page);


}