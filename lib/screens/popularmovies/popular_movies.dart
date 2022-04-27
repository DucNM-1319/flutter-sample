import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:ducnm_flutter_sample1/network/api_services.dart';
import 'package:ducnm_flutter_sample1/network/entity/movie_info_entity.dart';
import 'package:ducnm_flutter_sample1/network/response/popular_movies_response.dart';
import 'package:flutter/material.dart';

import '../detailmovie/detail_movie.dart';

class PopularMovieScreen extends StatefulWidget {
  const PopularMovieScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PopularMovieScreenState();
}

class PopularMovieScreenState extends State<PopularMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Popular',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<PopularMoviesResponse> _buildBody(BuildContext context) {
    final client =
        ApiServices(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<PopularMoviesResponse>(
      future:
          client.getPopularMovies(ApiServices.API_KEY, ApiServices.LANGUAGE, 1),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final PopularMoviesResponse response = snapshot.requireData;
          return _buildPosts(context, response.results);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, List<MovieInfo> movieList) {
    return ListView.builder(
      itemCount: movieList.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        var movieData = movieList[index];
        return Card(
          elevation: 4,
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailMovieScreen(movieInfo: movieData))
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CachedNetworkImage(
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    imageUrl: movieData.getPosterImage(),
                    height: 160,
                    fit: BoxFit.fitHeight,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movieData.title ?? '',
                            style: const TextStyle(fontSize: 20),
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            movieData.overview ?? '',
                            style: const TextStyle(),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
