class Movie{
  final String title;
  final String imagePath;
  final String director;
  final String category;
  final int year;

 const Movie({
   required this.title,
   required this.imagePath, 
   required this.director, 
   required this.category, 
   required this.year, 
  
    
 });

 static const List<Movie> movies = [
  Movie(
    title: 'Avengers: Infinity War', 
    imagePath: 'https://i0.wp.com/imgs.hipertextual.com/wp-content/uploads/2018/04/avengers_infinity_war_joe_anthony_russo.jpg?fit=1500%2C1000&quality=50&strip=all&ssl=1', 
    director: 'Marvel Studio', 
    category: 'Acción', 
    year: 2018, 
   
    ),
  Movie(
    title: 'Super Mario Bros', 
    imagePath: 'https://www.gamereactor.es/media/46/_3994653b.jpg', 
    director: 'Aaron Horvath, Michael Jelenic', 
    category: 'Aventura', 
    year: 2023, 
    
    ),
   Movie(
    title: 'La laguna negra', 
    imagePath: 'https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2019/07/creature-from-the-black-lagoon.jpg', 
    director: 'Arturo Ruiz Castillo', 
    category: 'Drama', 
    year: 1952, 
   ),
    Movie(
    title: 'Avatar 2', 
    imagePath: 'https://i0.wp.com/www.themoviedb.org/t/p/w780/8rpDcsfLJypbO6vREc0547VKqEv.jpg', 
    director: 'James Cameron', 
    category: 'Fantasía', 
    year: 2022, 
   ),
    Movie(
    title: 'Votos de amor', 
    imagePath: 'https://m.media-amazon.com/images/M/MV5BMTY2MjE5NzYwNl5BMl5BanBnXkFtZTcwNzE4MzgxNw@@._V1_.jpg', 
    director: 'Michael Sucsy', 
    category: 'Romance', 
    year: 2012, 
   ),
    Movie(
    title: 'El internado', 
    imagePath: 'https://fotografias-atreseries.atresmedia.com/clipping/cmsimages01/2017/05/24/C304E716-163E-4F33-8CB5-36D08FA7C900/98.jpg?crop=3852,2167,x0,y0&width=1900&height=1069&optimize=low&format=webply', 
    director: 'Daniel Écija', 
    category: 'Suspenso', 
    year: 2007, 
   ),
 ];
}