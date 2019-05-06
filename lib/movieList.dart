import 'package:flutter/material.dart';
import 'package:taller_lince/commons/httpHandler.dart';
import 'models/movie.dart';
import 'movieDetails.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => new _MovieListState();
 }

class _MovieListState extends State<MovieList> {

  List<Movies> listMovieAction    = new List();
  List<Movies> listMovieComedy = new List();
  List<Movies> listMovieHorror     = new List();
  List<Movies> listMovieRomance   = new List(); 

  @override
  void initState(){
    super.initState();
    getMoviesAction();
    getMoviesComedy();
    getMoviesHorror();
    getMoviesRomance();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
             child: Text(
              'Acción',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              )
            ),
          ),
          SizedBox(height: 7,),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listMovieAction.length,
              itemBuilder: (BuildContext context, int index){
                return MovieItem(listMovieAction[index]);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
             child: Text(
              'Comedia',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              )
            ),
          ),
          SizedBox(height: 7,),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listMovieComedy.length,
              itemBuilder: (BuildContext context, int index){
                return MovieItem(listMovieComedy[index]);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
             child: Text(
              'Horror',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              )
            ),
          ),
          SizedBox(height: 7,),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listMovieHorror.length,
              itemBuilder: (BuildContext context, int index){
                return MovieItem(listMovieHorror[index]);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
             child: Text(
              'Romance',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              )
            ),
          ),
          SizedBox(height: 7,),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listMovieRomance.length,
              itemBuilder: (BuildContext context, int index){
                return MovieItem(listMovieRomance[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  void getMoviesAction() async {
    var movies = await HttpHandler().getMoviesAction();
    setState(() {
      listMovieAction.addAll(movies);
    });
    print('Titulo de la pelicula ${listMovieAction[19].title}');
  }

  void getMoviesComedy() async {
    var movies = await HttpHandler().getMoviesComedy();
    setState(() {
      listMovieComedy.addAll(movies);
    });
    print('Titulo de la pelicula ${listMovieAction[19].title}');
  }

  void getMoviesHorror() async {
    var movies = await HttpHandler().getMoviesHorror();
    setState(() {
      listMovieHorror.addAll(movies);
    });
    print('Titulo de la pelicula ${listMovieAction[19].title}');
  }

  void getMoviesRomance() async {
    var movies = await HttpHandler().getMoviesRomance();
    setState(() {
      listMovieRomance.addAll(movies);
    });
    print('Titulo de la pelicula ${listMovieAction[19].title}');
  }

}

class MovieItem extends StatelessWidget {

  final Movies movie;
  MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child:GestureDetector(
        child: Card(
          margin: EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 10),
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              new FadeInImage.assetNetwork(
                  placeholder: "assets/images/moviefilm.png",
                  image: HttpHandler.image+movie.poster_path,
                  fit: BoxFit.fill, //Permite definir como se desplegará la imagen dentro del box
                  height: 190.0,
                  width: double.infinity,
                  fadeInDuration: new Duration(milliseconds: 40),
                ),
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[850].withOpacity(0.5)
                  ),
                  constraints: BoxConstraints.expand(
                    height: 50,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 20,
                width: 100,
                child: Text(
                  movie.title,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Positioned(
                right: 10,
                bottom: 15,
                //width: 30,
                child: Row(
                  children: <Widget>[
                    Text(
                      '${movie.vote_average}',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetails(movies: movie))
        ),
      )
    );
  }
}