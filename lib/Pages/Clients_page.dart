import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fornit_app/model/note.dart';
import 'products_details.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: clientList(),
    );
  }
}

class clientList extends StatefulWidget {

  @override
  _clientListState createState() => _clientListState();
}

class _clientListState extends State<clientList>
  with SingleTickerProviderStateMixin {
  TabController controller;
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }


  List<Note> _notes = List<Note>();

  Future<List<Note>> fetchNotes() async {
    var url = 'https://raw.githubusercontent.com/boriszv/json/master/random_example.json';
    String response = await rootBundle.loadString('data/menu_opts.json');

    var notes = List<Note>();

    //if (response.statusCode == 200) {
      Map notesJson = json.decode(response);
    //print('**********************************************productos****************************************************');

      //print(notesJson);
      for (var noteJson in notesJson['Product']) {
        print(Note.fromJson(noteJson));

        notes.add(Note.fromJson(noteJson));
      }
    //}
    //print(notes);
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Clientes'),
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
           // print(_notes[index]);
            return Padding(
              padding: EdgeInsets.only(left: 15.0, right: 5.0, top: 15.0),
              child: Container(
                height: 160.0,
                width: double.infinity,
                color: Colors.white,
                child: Row(

                  children: <Widget>[
                    Container(
                      width: 120.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/Productos/sofa.png'), fit: BoxFit.cover)),
                    ),
                    SizedBox(width: 4.0),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                             _notes[index].title,
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            //SizedBox(width: 45.0, height: 55.0),
                            Material(
                              //elevation: isFavorite ? 0.0 : 2.0,
                              borderRadius: BorderRadius.circular(20.0),

                            )
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          width: 180.0,
                          child: Text(
                            _notes[index].descripcion,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.grey,
                                fontSize: 12.0),
                          ),
                        ),
                        SizedBox(height: 7.0),
                        Row(
                          children: <Widget>[

                            //SizedBox(width: 25.0),
                            Container(
                              margin: const EdgeInsets.only(left: 20.0),
                              height: 40.0,
                              width: 75.0,
                              color: Color(getColorHexFromStr('#00d2d3')),
                              child: Center(
                                child: Text(
                                  'lps.' + _notes[index].precio,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            RaisedButton(
                              color: Color(getColorHexFromStr('#48dbfb')),
                              child: Text('descripción',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold),


                              ),
                              textColor: Colors.white,

                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => new MyDetailPage( note: _notes[index])),
                                );
                              },
                            ),


                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: _notes.length,
        )
    );
  }
}