import 'package:dio/dio.dart';
import 'package:ducnm_flutter_sample1/network/entity/movie_info_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../network/api_services.dart';

class PopularMoviesViewModel extends ChangeNotifier {
  AsyncValue<List<MovieInfo>> _myListMovies = const AsyncValue.loading();

  AsyncValue<List<MovieInfo>> get myListMovies => _myListMovies;

  var currentPage = 1;

  PopularMoviesViewModel() {
    fetchPopularMovies();
  }

  void fetchPopularMovies() async {
    final client = ApiServices(Dio(BaseOptions(contentType: "application/json")));

    final response = await client.getPopularMovies(ApiServices.API_KEY, ApiServices.LANGUAGE, currentPage);
    _myListMovies = AsyncValue.data(response.results);
    currentPage = response.page??0 + 1;
    notifyListeners();
  }
}