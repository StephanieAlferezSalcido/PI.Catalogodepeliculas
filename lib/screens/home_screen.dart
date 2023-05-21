import 'package:flutter/material.dart';
import 'package:moviesflutter/models/movies_models.dart';
import 'package:moviesflutter/screens/add_movies.dart';
import 'package:moviesflutter/screens/login_screen.dart';
import 'package:moviesflutter/screens/movies_screen.dart';
import 'package:moviesflutter/widgets/movie_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Movie> movies = Movie.movies;

      final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
              Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => addMovies()));
          },
          child: Text(
            "CRUD películas",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, 
                color: Colors.white, 
                fontWeight: FontWeight.bold),
          )),
    );



    return Scaffold(
      appBar: AppBar(
        title: const Text("Catálogo de películas"),
       
      ),
      
      extendBodyBehindAppBar: true,
       body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 100.0,
          ),
        child: 
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          signUpButton,
          SizedBox(height: 15),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.titleLarge,
              children: [
                TextSpan(
                  text: 'Destacados',
                  style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
                  
                  ),
                  
              ],
            ),
            
             
          ),
          const SizedBox(height: 20),
          for (final movie in movies) 
          InkWell(
            onTap: (){
              Navigator.push(
                context, 
              MaterialPageRoute(
                builder: (context) => MovieScreen(movie:movie),
                ),
                );
            },
            child: MovieListItem(
              imageUrl: movie.imagePath,
              name: movie.title,
              information: '${movie.director} | ${movie.category} | ${movie.year} ',
            ),
          )

        ],
        ),
       ),
       )
    );
}
}
