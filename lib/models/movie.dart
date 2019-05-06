class Movies {

  String title;
  String overview;
  String poster_path;
  double vote_average;


  Movies({
    this.title,
    this.overview,
    this.poster_path,
    this.vote_average,
  });

  factory Movies.fromJson(Map jsonMap){
    return Movies(
      title: jsonMap['title'],
      overview: jsonMap['overview'],
      poster_path: jsonMap['poster_path'],
      vote_average: jsonMap['vote_average'].toDouble()
    );
  }
}

class ListMovies {

  List<Movies> movies;

  ListMovies({
    this.movies,
  });

  factory ListMovies.fromJson(List<dynamic> jsonList){
    List<Movies> movies = new List<Movies>();
    movies = jsonList.map((i) => Movies.fromJson(i)).toList();
    return ListMovies(
      movies: movies
    );
  }

}