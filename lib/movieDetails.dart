import 'package:flutter/material.dart';
import 'package:taller_lince/commons/httpHandler.dart';
import 'models/movie.dart';

class MovieDetails extends StatelessWidget {

  final Movies movies;
  MovieDetails({
    this.movies
  });

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: const Color(0xFF333C45),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 160,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                movies.title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              background: Image.network(
                HttpHandler.image+movies.poster_path,
                fit: BoxFit.fill,
              ),
            ),
            elevation: 5.0,
          ),
          SliverFillRemaining(
            child: Container(
              padding: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                top: 20.0
              ),
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width,
                    height: 40,
                    child: RaisedButton.icon(
                      label: Text('Reproducir'),
                      icon: Icon(Icons.play_arrow),
                      onPressed: () => print('Reproducir'),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    movies.overview,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    ),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}