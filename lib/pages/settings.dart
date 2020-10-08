import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int favColor = Colors.green.value;
  int fontColor = Colors.black.value;
  int fontSizeDefault = 15;

  double _value = 15;

  SharedPreferences prefs;

  saveDataColor(color) async {
    prefs = await SharedPreferences.getInstance();

    prefs.setInt('favC', favColor);
  }

  saveDataFontColor(color) async {
    prefs = await SharedPreferences.getInstance();

    prefs.setInt('fontC', fontColor);
  }

  saveDataFont(sizeFont) async {
    prefs = await SharedPreferences.getInstance();

    prefs.setDouble('fontS', _value);
  }

  getData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      favColor = prefs.getInt('favC') ?? Colors.blueAccent.value;
      fontColor = prefs.getInt('fontC') ?? Colors.black.value;
      _value = prefs.getDouble('fontS') ?? fontSizeDefault;
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(favColor),
      ),
      body: Column(
        children: [
          titleForSetting('Bar Color '),
          RadioListTile(
              title: Text('Green'),
              value: Colors.green.value,
              groupValue: favColor,
              onChanged: (color) {
                setState(() {
                  favColor = color;
                });
                saveDataColor(color);
              }),
          RadioListTile(
              title: Text('Red'),
              value: Colors.redAccent.value,
              groupValue: favColor,
              onChanged: (color) {
                setState(() {
                  favColor = color;
                });
                saveDataColor(color);
              }),
          RadioListTile(
              title: Text('Blue'),
              value: Colors.blueAccent.value,
              groupValue: favColor,
              onChanged: (color) {
                setState(() {
                  favColor = color;
                });
                saveDataColor(color);
              }),
          Divider(),
          titleForSetting('Font Size'),
          textSize(),
          titleForSetting('Font Color '),
          RadioListTile(
              title: Text('Black'),
              value: Colors.black.value,
              groupValue: fontColor,
              onChanged: (color) {
                setState(() {
                  fontColor = color;
                });
                saveDataFontColor(color);
              }),
          RadioListTile(
              title: Text('Grey'),
              value: Colors.grey[800].value,
              groupValue: fontColor,
              onChanged: (color) {
                setState(() {
                  fontColor = color;
                });
                saveDataFontColor(color);
              }),
          RadioListTile(
              title: Text('Blue'),
              value: Colors.blueAccent.value,
              groupValue: fontColor,
              onChanged: (color) {
                setState(() {
                  fontColor = color;
                });
                saveDataFontColor(color);
              }),
        ],
      ),
    );
  }

  Widget titleForSetting(title) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 25.0, bottom: 8.0),
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget textSize() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: DropdownButton(
          value: _value,
          items: [
            DropdownMenuItem(
              child: Text("1 Item"),
              value: 15.0,
              onTap: () {
                _value = 15.0;
              },
            ),
            DropdownMenuItem(
              child: Text("2 Item"),
              value: 20.0,
              onTap: () {
                _value = 20.0;
              },
            ),
            DropdownMenuItem(
              child: Text("3 Item"),
              value: 25.0,
              onTap: () {
                _value = 25.0;
              },
            ),
          ],
          onChanged: (value) {
            setState(() {
              _value = value;
            });
            print(value);
            saveDataFont(value);
          }),
    );
  }
}
