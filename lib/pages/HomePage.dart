import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( 
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Estas logeado"),
              SizedBox(height: 15.0,),
              OutlineButton(
                onPressed: (){},
                borderSide: BorderSide(color: Colors.red, style: BorderStyle.solid, width: 3.0),
                child: Text("Cerrar Session"),
              )
            ],
          ),
        )
      ),
    );
  }
}