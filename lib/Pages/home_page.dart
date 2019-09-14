
import 'package:flutter/material.dart';

import 'Products_page.dart';
import 'Clients_page.dart';

class HomePage extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  static String tag = 'home-page';
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  //TabController 

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
      body: ListView(children: <Widget>[
        Column(children: <Widget>[
          Stack(children: <Widget>[
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
                      height: 85.0,
                      width: 85.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(47.5),
                          border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 3.0),
                          image: DecorationImage(
                              image: AssetImage('assets/images/Home/man.png'))),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 35.0),
                        Text(
                          'Hola , Javier',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Codigo: 176****590',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 15.0,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Escoge una opción',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ],
                    ),
                    //SizedBox(width: MediaQuery.of(context).size.width - 205.0),
                
                    SizedBox(height: 15.0)
                  ],
                ),
                SizedBox(height: 40.0),
             
                SizedBox(height: 25.0),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        cardDetails('Productos', 'assets/images/Home/delivery-man.png'),
                        cardDetails('Clientes', 'assets/images/Home/target.png'),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        cardDetails('Facturas por cobrar', 'assets/images/Home/payment-method.png'),
                        cardDetails('Carrito de compra', 'assets/images/Home/shopping-cart.png'),
                      ],
                    ),
                    SizedBox(height: 5.0)
                  ],
                )
              ],
            )
          ]),
         
        ])
      ]),
       bottomNavigationBar:Container(
        //height: 105.0,
        child: BottomAppBar(
          color: Color.fromRGBO(25, 42, 86,1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget >[
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {},
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

  

  Widget cardDetails(String title, String imgPath) {
    return Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(7.0),
       child: new InkWell(
                        onTap: () {
                           
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => clientList()),
                              
                              );
                          //print("tapped");
                        },
                        child: Container(
                          height: 220,
                          width: (MediaQuery.of(context).size.width / 2) - 20.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0), color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 10.0),
                              Padding(
                                padding: EdgeInsets.only(left: 40.0, top: 35),
                                child: Image.asset(
                                  imgPath,
                                  fit: BoxFit.cover,
                                  height: 80.0,
                                  width: 80.0,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Padding(
                                padding: EdgeInsets.only(left: 15.0, top: 20),
                                child:Center(
                                    child: Text(title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Quicksand',
                                      fontSize: 15.0,
                                      color: Colors.black,
                                    )),
                                )
                                
                              ),
                              SizedBox(height: 3.0),
                              
                            ],
                          ),
                        ),
      ),
    );
  }
}

  