import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpref/pages/settings.dart';
import 'package:sharedpref/pages/settings.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPreferences prefs;
  int color = Colors.blueAccent.value;
  int fontColor = Colors.black.value;
  double fontSize = 12.0;
  double fontSizeDefault = 12.0;
  getData() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      color = prefs.getInt('favC') ?? Colors.blueAccent.value;
      fontSize = prefs.getDouble('fontS') ?? fontSizeDefault;
      fontColor = prefs.getInt('fontC') ?? Colors.black.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Color(color),
        title: Text('Shared Preferences'),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Settings();
                  })))
        ],
      ),
      body: Card(
          margin: EdgeInsets.all(10.0),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(fontSize: fontSize, color: Color(fontColor)),
            ),
          )),
    );
  }
}
