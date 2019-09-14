
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'products_details.dart';
//import 'home_page.dart';

class ProductPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Home',

      home: new ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  static String tag = 'products-page';
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage>
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 250.0,
                    width: double.infinity,
                    color: Color(getColorHexFromStr('#00d2d3')),
                  ),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 15.0),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 15.0),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 2.0),
                                image: DecorationImage(
                                    image: AssetImage('assets/images/Home/man.png'))),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 120.0),
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () {},
                              color: Colors.white,
                              iconSize: 30.0,
                            ),
                          ),
                          SizedBox(height: 15.0),
                        ],
                      ),
                      SizedBox(height: 50.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Hola , Javier',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Que desea vender?',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(5.0),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.search,
                                      color:
                                          Color(getColorHexFromStr('#00d2d3')),
                                      size: 30.0),
                                  contentPadding:
                                      EdgeInsets.only(left: 15.0, top: 15.0),
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Quicksand'))),
                        ),
                      ),
                      SizedBox(height: 10.0)
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Stack(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Material(
                      elevation: 1.0,
                      child: Container(height: 75.0, color: Colors.white)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/sofas.png'))),
                            ),
                            Text(
                              'Sofas',
                              style: TextStyle(fontFamily: 'Quicksand'),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/wardrobe.png'))),
                            ),
                            Text(
                              'Wardrobe',
                              style: TextStyle(fontFamily: 'Quicksand'),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/desks.png'))),
                            ),
                            Text(
                              'Desk',
                              style: TextStyle(fontFamily: 'Quicksand'),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/dressers.png'))),
                            ),
                            Text(
                              'Dresser',
                              style: TextStyle(fontFamily: 'Quicksand'),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              itemCard('Mueble Azul', 'assets/images/Productos/3476057_1.jpg', false),
              itemCard('Sofa Cafe', 'assets/images/Productos/3672471_1.jpg', true),
              itemCard('Mueble estampado', 'assets/images/Productos/3996586_1.jpg', true)
            ],
          )
        ],
      ),
       bottomNavigationBar:Container(
        //height: 105.0,
        child: BottomAppBar(
          color: Color.fromRGBO(25, 42, 86,1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget >[
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListPage()),
                    );
                },
              ),
              IconButton(
                icon: Icon(Icons.payment, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.cyan),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemCard(String title, String imgPath, bool isFavorite) {
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
                      image: AssetImage(imgPath), fit: BoxFit.cover)),
            ),
            SizedBox(width: 4.0),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    //SizedBox(width: 45.0, height: 55.0),
                    Material(
                      elevation: isFavorite ? 0.0 : 2.0,
                      borderRadius: BorderRadius.circular(20.0),
                      
                    )
                  ],
                ),
                SizedBox(height: 5.0),
                Container(
                  width: 180.0,
                  child: Text(
                    'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
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
                          'lps.5,480',
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
                              MaterialPageRoute(builder: (context) => MyDetailPage()),
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
  }
}