import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moviesflutter/models/movies_models.dart';

class MovieScreen extends StatelessWidget{
  final Movie movie;
  const MovieScreen({
    Key? key, 
    required this.movie
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         ..._builBackground(context, movie),
         _builMovieInformation(context),

        ],
      ),
    );
  }
         Positioned _builMovieInformation(BuildContext context){
          return Positioned(
          bottom: 150,
          width: MediaQuery.of(context).size.width,
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Column(
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${movie.director} | ${movie.category} | ${movie.year}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                RatingBar.builder(
                  initialRating: 3.5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemCount: 5,
                  itemSize: 20,
                  unratedColor: Colors.white,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, index){
                    return const Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  },
                  onRatingUpdate: (rating) {
                  },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Los superhéroes se alían para vencer al poderoso Thanos, el peor enemigo al que se han enfrentado. Si Thanos logra reunir las seis gemas del infinito: poder, tiempo, alma, realidad, mente y espacio, nadie podrá detenerlo',
                    maxLines: 8,
                    style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(height: 1.75, color: Colors.white),
                  )

              ],
             ),
           ),
         );
         }
  
  }

  List<Widget> _builBackground(
    context,
    movie,
  ) {
    return [Container(
      height: double.infinity,
      color: Colors.red,
    ),    Image.network(
            movie.imagePath,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            fit: BoxFit.cover,
          ),
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.red,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.5],
                ), 


            ),
            ),
            ),];
  }
