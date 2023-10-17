import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shuttle Safe",
              style: TextStyle(
                fontFamily: "Quicksand",
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              )),
          centerTitle: true,
          backgroundColor: Colors.lightGreen[400],
        ),

        body: Center(
          child: Image(
            image: NetworkImage("https://w.forfun.com/fetch/42/42f647d37b4225d5ac7e50e6d3f1c019.jpeg?h=900&r=0.5"),
          ),
        ),

        floatingActionButton: SizedBox.fromSize(
          size: Size(80, 80), // button width and height
          child: ClipOval(
            child: Material(
              color: Colors.lightGreen[400], // button color
              child: InkWell(
                splashColor: Colors.green, // splash color
                onTap: () {}, // button pressed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.call,
                      color: Colors.white,
                      size: 40,), // icon
                    Text("Call Host",
                        style: TextStyle(
                          color: Colors.white,
                        )), // text
                  ],
                ),
              ),
            ),
          ),
        ),
    );


  }
}

