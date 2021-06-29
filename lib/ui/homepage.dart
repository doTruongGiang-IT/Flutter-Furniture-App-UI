import 'package:flutter/material.dart';
import 'package:furniture_app/ui/cartpage.dart';
import 'package:furniture_app/ui/detailpage.dart';
import 'package:furniture_app/ui/statspage.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController controller;

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
                    bottom: 80,
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
                    bottom: 130,
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
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          SizedBox(width: 15,),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.white, style: BorderStyle.solid, width: 3),
                              image: DecorationImage(image: AssetImage("images/avatar.jpg"), fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width - 135,),
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.menu, size: 40, color: Colors.white,),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 45,),
                      Padding(
                        padding: EdgeInsets.only(left: 15, bottom: 10),
                        child: Text("Hello, Giang", style: TextStyle(fontFamily: "Quicksand", fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("What do you want to buy ?", style: TextStyle(fontFamily: "Quicksand", fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Search Item ....",
                              hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search, color: Color(getColorHexFromStr("#FDD148")),),
                              contentPadding: EdgeInsets.only(top: 10, left: 10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Stack(
                children: [
                  Material(
                    elevation: 3,
                    child: Container(
                      height: 75,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCategory("images/sofas.jpg", "Sofas"),
                      _buildCategory("images/wardrobe.jpg", "Wardrobe"),
                      _buildCategory("images/desk.jpg", "Desk"),
                      _buildCategory("images/dresser.jpg", "Dresser"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30,),
              _buildCard("images/Sofa1.png", "Sofa 1", true, "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", 562.8),
              _buildCard("images/Sofa2.png", "Sofa 2", false, "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", 813.4),
              _buildCard("images/Sofa3.png", "Sofa 3", true, "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", 734.5),
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
              onPressed: () {},
              icon: Icon(Icons.event_seat), 
              color: Colors.yellow,
              iconSize: 40,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.timer), 
              color: Colors.grey,
              iconSize: 40,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPage(),));
              },
              icon: Icon(Icons.shopping_cart), 
              color: Colors.grey,
              iconSize: 40,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => StatsPage(),));
              },
              icon: Icon(Icons.person_outline), 
              color: Colors.grey,
              iconSize: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String image, String name) {
    return Container(
              height: 75,
              width: (MediaQuery.of(context).size.width - 30) / 4,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(image)),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(name, style: TextStyle(fontFamily: "Quicksand"),),
                ],
              ),
            );
  }

  Widget _buildCard(String image, String name, bool isFavorite, String description, double price) {
    return Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child:  Material(
                      elevation: 3,
                      child: Container(
                        height: 200,
                        color: Colors.white,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(name: name, isFavorite: isFavorite, description: description, price: price),),);
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                height: 200,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Image(image: AssetImage(image),)
                              ),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "Quicksand"),),
                                    SizedBox(width: 60,),
                                    Material(
                                      elevation: 3,
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width: 30,
                                        child: IconButton(
                                          onPressed: () => {!isFavorite}, 
                                          icon: isFavorite ? Icon(Icons.favorite, size: 15, color: Colors.red,) : Icon(Icons.favorite, size: 15, color: Colors.grey,),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Container(
                                  width: 150,
                                  child: Text(description, textAlign: TextAlign.left, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey, fontFamily: "Quicksand"),),
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 60,
                                      color: Colors.orange,
                                      child: Center(child: Text("\$$price", style: TextStyle(fontSize: 15, color: Colors.white),)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      height: 40,
                                      color: Color(getColorHexFromStr("#FDD148")),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Center(child: Text("Add to cart", style: TextStyle(fontSize: 15, color: Colors.white),),),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          
                          ],
                        ),
                      ),
                    ),
          );
  }
}