import 'package:cached_network_image/cached_network_image.dart';
import 'package:ducnm_flutter_sample1/network/entity/movie_info_entity.dart';
import 'package:ducnm_flutter_sample1/screens/popularmovies/popular_movies_view_model.dart';
import 'package:ducnm_flutter_sample1/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../detailmovie/detail_movie.dart';

final popularViewModelProvider = ChangeNotifierProvider<PopularMoviesViewModel>(
      (ref) => PopularMoviesViewModel(),
);

class PopularMovieScreen extends StatelessWidget {
  const PopularMovieScreen({Key? key}) : super(key: key);

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
      body: Consumer(builder: (context, ref, _) {
        return ref.watch(popularViewModelProvider).myListMovies.when(data: (data) {
          return _createMyListView(context, data);
        }, loading: () {
          return const Loading();
        }, error: (e, s) {
          return const SizedBox();
        });
      }),
    );
  }

  Widget _createMyListView(BuildContext context, List<MovieInfo> movieList) {
    return ListView.builder(
      itemCount: movieList.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        var movieData = movieList[index];
        return Card(
          elevation: 4,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailMovieScreen(movieInfo: movieData)));
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
