import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taller_lince/models/movie.dart';

class HttpHandler{

  static String image = 'https://image.tmdb.org/t/p/w500/';

  final String apiKey = '128aff85f8d320a612588712b7a2b6cd';
  final String url    = '';

  Future<List<Movies>> getMoviesAction() async {

    ListMovies listMovies;

    http.Response  response = await http.get(
      'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=28'
    );
    

    try{
      if(response.statusCode == 200){
        print('Entro al if');
        final jsonResponse   = jsonDecode(response.body);
        listMovies = new ListMovies.fromJson(jsonResponse['results']);
      }
      else{
        listMovies = new ListMovies();
      }
    }catch(e){
      print(e.toString());
    }
    print(listMovies.movies[3]);
    return listMovies.movies;
  }

  Future<List<Movies>> getMoviesComedy() async {

    ListMovies listMovies;

    http.Response  response = await http.get(
      'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=35'
    );
    

    try{
      if(response.statusCode == 200){
        print('Entro al if');
        final jsonResponse   = jsonDecode(response.body);
        listMovies = new ListMovies.fromJson(jsonResponse['results']);
      }
      else{
        listMovies = new ListMovies();
      }
    }catch(e){
      print(e.toString());
    }
    print(listMovies.movies[3]);
    return listMovies.movies;
  }

  Future<List<Movies>> getMoviesHorror() async {

    ListMovies listMovies;

    http.Response  response = await http.get(
      'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=27'
    );
    

    try{
      if(response.statusCode == 200){
        print('Entro al if');
        final jsonResponse   = jsonDecode(response.body);
        listMovies = new ListMovies.fromJson(jsonResponse['results']);
      }
      else{
        listMovies = new ListMovies();
      }
    }catch(e){
      print(e.toString());
    }
    print(listMovies.movies[3]);
    return listMovies.movies;
  }

  Future<List<Movies>> getMoviesRomance() async {

    ListMovies listMovies;

    http.Response  response = await http.get(
      'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=10749'
    );
    

    try{
      if(response.statusCode == 200){
        print('Entro al if');
        final jsonResponse   = jsonDecode(response.body);
        listMovies = new ListMovies.fromJson(jsonResponse['results']);
      }
      else{
        listMovies = new ListMovies();
      }
    }catch(e){
      print(e.toString());
    }
    print(listMovies.movies[3]);
    return listMovies.movies;
  }

}