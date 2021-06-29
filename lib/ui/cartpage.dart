import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with SingleTickerProviderStateMixin {
  late TabController controller;
  int cartItemIndex = -1;

  int getColorHexFromStr(String color) {
    color = "FF" + color;
    color = color.replaceAll("#", "");
    int val = 0;
    int length = color.length;
    for(int i = 0; i < length; i++) {
      int hexDigit = color.codeUnitAt(i);
      if(hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (length - 1 -i)));
      }else if(hexDigit >= 65 && hexDigit <= 70) {
        val += (hexDigit - 55) * (1 << (4 * (length - 1 -i)));
      }else if(hexDigit >= 97 && hexDigit <= 102) {
        val += (hexDigit - 87) * (1 << (4 * (length - 1 -i)));
      }else {
        throw new FormatException("An error occured when converting a color");
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
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    color: Color(getColorHexFromStr("#FDD148")),
                  ),
                  Positioned(
                    bottom: 480,
                    right: 100,
                    child: Container(
                      height: 400,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Color(getColorHexFromStr("#FEED84")).withOpacity(0.5),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 530,
                    left: 150,
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Color(getColorHexFromStr("#FEED84")).withOpacity(0.5),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 70),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              }, 
                              icon: Icon(Icons.arrow_back),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text("Shopping Cart", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
                            ),
                          ],
                        ),
                      ),
                      _buildCardItem(0, "images/Sofa1.png", "Sofa1", "brown", 562.8, 2),
                      _buildCardItem(1, "images/Sofa2.png", "Sofa2", "blue", 813.4, 1),
                      _buildCardItem(2, "images/Sofa3.png", "Sofa3", "yellow", 734.5, 2),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text("Pick of the week", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                    ),
                    SizedBox(height: 15,),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          image: DecorationImage(image: AssetImage("images/Sofa4.png"), fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: controller,
          indicatorColor: Colors.transparent,
          tabs: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.event_seat), 
              color: Colors.grey,
              iconSize: 40,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.timer), 
              color: Colors.grey,
              iconSize: 40,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart), 
              color: Colors.yellow,
              iconSize: 40,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_outline), 
              color: Colors.grey,
              iconSize: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardItem(int index, String image, String name, String color, double price, int qty) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    cartItemIndex = index;
                  });
                }, 
                icon: (cartItemIndex == index) ? Icon(Icons.circle_rounded, color: Colors.yellow, size: 18,) : Icon(Icons.circle_outlined, color: Colors.grey, size: 18,),
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image), fit: BoxFit.contain),
                ),
              ),
              SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Text(name, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text("Color: $color", style: TextStyle(fontSize: 16, color: Colors.grey),),
                  SizedBox(height: 5,),
                  Text("\$$price", style: TextStyle(fontSize: 20, color: Colors.yellow, fontWeight: FontWeight.bold),)
                ],
              ),
              SizedBox(width: 15,),
              Padding(
                padding: EdgeInsets.only(bottom: 100, left: 40),
                child: qty > 1 ? Text("x$qty", style: TextStyle(fontSize: 14, color: Colors.grey),) : Text(""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}