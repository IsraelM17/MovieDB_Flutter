import 'package:flutter/material.dart';

class More extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(18),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                  radius: 40,
                ),
                SizedBox(width: 15,),
                Text(
                  'Israel Moreno',
                  style: TextStyle(
                    color: Colors.grey[350],
                    fontSize: 25
                  ),
                ),
              ],
            ),
            SizedBox(height: 25,),
            FlatButton(
              child: _optionMore(Icons.person, 'Perfil', 'Cambiar perfil de la cuenta'),
              onPressed: () => print('Cambiar Perfil'),
            ),
            SizedBox(height: 17,),
              FlatButton(
              child: _optionMore(Icons.settings, 'Configuracion', 'WiFi, Calidad de video, etc.'),
              onPressed: () => print('Configuración'),
            ),
            SizedBox(height: 17,),
              FlatButton(
              child: _optionMore(Icons.phone, 'Contactanos', 'Comunicate con nosotros'),
              onPressed: () => print('Contacto'),
            ),
            SizedBox(height: 17,),
              FlatButton(
              child: _optionMore(Icons.info, 'A cerca de', 'Equipo de desarrollo'),
              onPressed: () => print('Cambiar Perfil'),
            ),
            SizedBox(height: 17,),
              FlatButton(
              child: _optionMore(Icons.exit_to_app, 'Cerrar Sesión', 'No te vayas :c'),
              onPressed: () => print('Cerrar sesión'),
            ),
          ],
        ),
      )
    );
  }

  Row _optionMore(IconData icon, title, subtitle){
    return Row(
      children: <Widget>[
        Icon(
          icon,
          size: 40,
          color: Colors.grey[400],
        ),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: TextStyle(color: Colors.grey[350], fontSize: 18),),
            SizedBox(height: 5,),
            Text(subtitle, style: TextStyle(color: Colors.grey[350], fontSize: 13),)
          ],
        )
      ],
    );
  }

}