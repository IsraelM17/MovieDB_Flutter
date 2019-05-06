import 'package:flutter/material.dart';
import 'movieList.dart';
import 'more.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
 }

class _HomeState extends State<Home> {

  int contador = 0;
  int selectedOption = 0;

  final _bottomAppBarOption = [
    MovieList(),
    More()
  ];

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
        backgroundColor: const Color(0xFF333C45),
        appBar: AppBar(
          title: Text('Taller Lince'),
          backgroundColor: Color(0xFF0493CD),
          elevation: 5.0,
        ),
        body: PageView(
          children: <Widget>[
            _bottomAppBarOption.elementAt(selectedOption),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 15.0,
          backgroundColor: Color(0xFF9592FD).withOpacity(0.9),
          child: Icon(Icons.search),
          onPressed: () => print('Buscar'),
       ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       bottomNavigationBar: Theme(
         data: Theme.of(context).copyWith(
           canvasColor: Colors.grey.withOpacity(0.2),
           primaryColor: Color(0xFF0493CD),
           textTheme: Theme.of(context).textTheme.copyWith(caption: TextStyle(color: Colors.grey[400]))
         ),
         child: BottomNavigationBar(
           items: [
             BottomNavigationBarItem(
               icon: Icon(Icons.home),
               title: Text('Home')
             ),
             BottomNavigationBarItem(
               icon: Icon(Icons.menu),
               title: Text('Más')
             )
           ],
           onTap: _onItemTapped,
           currentIndex: selectedOption,
         ),
       )
   );
  }

  void _contador(){
    setState(() {
      contador ++;
      print('$contador');
    });
  }

  void _onItemTapped(int index){
    setState(() {
      selectedOption = index;
    });
  }

}