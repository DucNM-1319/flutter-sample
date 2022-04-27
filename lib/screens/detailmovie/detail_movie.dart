import 'package:cached_network_image/cached_network_image.dart';
import 'package:ducnm_flutter_sample1/network/entity/movie_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DetailMovieScreen extends StatefulWidget {
  final MovieInfo movieInfo;

  const DetailMovieScreen({Key? key, required this.movieInfo})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => DetailMovieScreenState();
}

class DetailMovieScreenState extends State<DetailMovieScreen> {
  @override
  Widget build(BuildContext context) {
    var movieInfo = widget.movieInfo;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Movie Detail",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: Column(
        children: <Widget>[
          Stack(alignment: AlignmentDirectional.bottomStart, children: [
            CachedNetworkImage(
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              imageUrl: movieInfo.getBackdropImage(),
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            Positioned(
              left: 24,
              bottom: 16,
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                imageUrl: movieInfo.getPosterImage(),
                height: 144,
                fit: BoxFit.fitHeight,
              ),
            ),
          ]),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Text(
                  movieInfo.title ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                )),
                SizedBox(
                    width: 36,
                    height: 36,
                    child: _getRadialGauge(movieInfo.voteAverage ?? 10)),
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.black26,
            thickness: 1,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        FaIcon(FontAwesomeIcons.solidCommentDots, color: Colors.green,),
                        SizedBox(height: 4),
                        Text('Reviews',)
                      ],
                    ),
                  ),
                ),
                const VerticalDivider(
                  width: 1,
                  color: Colors.black26,
                  thickness: 1,),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        FaIcon(FontAwesomeIcons.solidCirclePlay, color: Colors.deepOrangeAccent,),
                        SizedBox(height: 4),
                        Text('Trailer',)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.black26,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 88,
                  child: Column(
                    children: [
                      const Text('Genre', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(movieInfo.getFirstGenre(),)
                    ],
                  ),
                ),
                // Flexible(flex: 1, child: SizedBox(width: 10,),),

                Container(
                  width: 88,
                  child: Column(
                    
                    children: [
                      const Text('Release', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(movieInfo.releaseDate ?? 'N/A',)
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.black26,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(movieInfo.overview??'N/A'),
          )
        ],
      ),
    );
  }

  Widget _getRadialGauge(double voteAverage) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
          minimum: 0,
          maximum: 10,
          startAngle: 0,
          endAngle: 360,
          showTicks: false,
          showLabels: false,
          axisLineStyle: const AxisLineStyle(thickness: 5),
          pointers: <GaugePointer>[
            RangePointer(
              value: voteAverage,
              width: 5,
              color: Colors.black45,
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Text(voteAverage.toString(),
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold)),
              angle: 270,
            )
          ])
    ]);
  }
}
