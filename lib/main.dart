import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:micart/DrinksData.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  http.Response response;
  var jsondata;
  @override
  void initState() {
    super.initState();
    getJsonData();
  }

  getJsonData() async {
    response = await http.get(
        "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail");
    jsondata = jsonDecode(response.body)["drinks"];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: Colors.pink,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          elevation: 0.0,
          title: Text(
            "Json Example",
            style: TextStyle(
              fontFamily: 'ArchitectsDaughter-Regular',
            ),
          ),
        ),
        body: response == null
            ? Center(
                child: CircularProgressIndicator(backgroundColor: Colors.white),
              )
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.pink,
                    Colors.orange,
                  ]),
                ),
                child: ListView.builder(
                  itemCount: jsondata.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.transparent,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: ListTile(
                        leading: Hero(
                          tag: jsondata[index]["idDrink"],
                          child: CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            backgroundImage:
                                NetworkImage(jsondata[index]["strDrinkThumb"]),
                          ),
                        ),
                        title: Text(
                          "${jsondata[index]["strDrink"]}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontFamily: 'ArchitectsDaughter-Regular',
                          ),
                        ),
                        subtitle: Text(
                          "${jsondata[index]["idDrink"]}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'ArchitectsDaughter-Regular',
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DrinksData(jsondata[index]),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
