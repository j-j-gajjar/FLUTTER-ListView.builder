import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrinksData extends StatelessWidget {
  DrinksData(this.jsondata);
  var jsondata;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pink,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            )
          ],
          backgroundColor: Colors.pink,
          elevation: 0.0,
          title: Text(
            "${jsondata['strDrink']}",
            style: TextStyle(
              fontFamily: 'ArchitectsDaughter-Regular',
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 2.0,
              colors: [Colors.pink, Colors.blue, Colors.white],
            ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Hero(
                    tag: jsondata['idDrink'],
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(jsondata['strDrinkThumb']),
                      radius: 150,
                    ),
                  ),
                ),
                Text(
                  "${jsondata['strDrink']}",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'ArchitectsDaughter-Regular',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
