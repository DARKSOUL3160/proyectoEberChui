
import 'package:flutter/material.dart';
import 'Products_page.dart';
import 'carrito_page.dart';
import 'package:fornit_app/model/note.dart';
import 'Clients_page.dart';

class Detail extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyDetailPage(),
    );
  }
}

class MyDetailPage extends StatefulWidget {
  final Note note;
  // 2
  MyDetailPage({this.note});

  @override
  static String tag = 'details-page';
  _MyDetailPageState createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> {
  int photoIndex = 0;



  List<String> photos = [
    'assets/images/Productos/sofa.png',
    'assets/images/Productos/sofaBN.png',
    
  ];

  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

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

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle'),
        backgroundColor: Colors.blueAccent,
      ),
        body: ListView(
      shrinkWrap: true,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 275.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Productos/sofaBN.png'), //AssetImage(photos[photoIndex]),
                          fit: BoxFit.cover)),
                ),
                GestureDetector(
                  child: Container(
                    height: 275.0,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                  ),
                  onTap: _nextImage,
                ),
                GestureDetector(
                  child: Container(
                    height: 275.0,
                    width: MediaQuery.of(context).size.width / 2,
                    color: Colors.transparent,
                  ),
                  onTap: _previousImage,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => clientList()),
                            );
                          }),
                    
                    ],
                  ),
                ),
                Positioned(
                    top: 240.0,
                    left: MediaQuery.of(context).size.width / 2 - 30.0,
                    child: Row(
                      children: <Widget>[
                        SelectedPhoto(
                          numberOfDots: photos.length,
                          photoIndex: photoIndex,
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                widget.note.title,
                style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 15.0,
                color: Colors.grey
          ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Text(widget.note.title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: <Widget>[
                  Container(
                width: (MediaQuery.of(context).size.width / 4 + MediaQuery.of(context).size.width / 2) - 10.0,
                child: Text(widget.note.descripcion,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 17.0,
                  color: Colors.grey.withOpacity(0.8),
                ),
                ),
              ),
              
                ],
              )
            ),
            SizedBox(height: 20.0),
         Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: <Widget>[
                 
                    Text('Cantidad en existencia: 8',
                      style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                  ),
                ),
                  
                ]
              )
          ),

        
            
          Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: <Widget>[
                 
                    Text('Precio:',
                      style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                  Text(' Lps. ' + widget.note.precio,
                      style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                ]
              )
          ),
        
        
          ],
        )
      ],
    ),
    bottomNavigationBar: Material(
      elevation: 7.0,
      color: Colors.white,
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          SizedBox(width: 10.0),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50.0,
                width: 50.0,
                color: Colors.white,
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.grey,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ListPage()),
                              
                              );
              },
              child: Container(
                height: 50.0,
                width: 50.0,
                color: Colors.white,
                child: Icon(
                  Icons.account_box,
                  color: Colors.grey,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShopingCar()),
                              
                              );
              },
            child:Container(
              color: Color(getColorHexFromStr('#48dbfb')),
              width: MediaQuery.of(context).size.width - 130.0,
              child: Center(
                child: Text(
                  'Vender',
                  style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                )
              )
            )
            )
          ]
        )
      )
    ),
    );
  }
}

class SelectedPhoto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;

  SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
    return new Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(4.0))),
      ),
    );
  }

  Widget _activePhoto() {
    return new Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, spreadRadius: 0.0, blurRadius: 2.0)
                ])),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < numberOfDots; ++i) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }

    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildDots(),
    ));
  }
}