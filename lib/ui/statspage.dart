import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({ Key? key }) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> with SingleTickerProviderStateMixin {
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
                    bottom: 350,
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
                    bottom: 400,
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
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Text("Giang", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "Quicksand"),),
                              Text("077****908", style: TextStyle(fontSize: 13, fontFamily: "Quicksand", color: Colors.grey)),
                            ],
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width - 200,),
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.settings, size: 40, color: Colors.white,),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 35,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildNav(Icon(Icons.folder_shared), "Favorite"),
                          _buildNav(Icon(Icons.wallet_giftcard), "Wallet"),
                          _buildNav(Icon(Icons.print_rounded), "Footprint"),
                          _buildNav(Icon(Icons.computer), "Coupon"),
                        ],
                      ),
                      SizedBox(height: 25,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildCardDetail("images/card.jpg", "Pending payment", 5),
                                _buildCardDetail("images/shipped.jpg", "To be shipped", 8),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildCardDetail("images/truck.jpg", "To be recieved", 2),
                                _buildCardDetail("images/return.jpg", "Return/replace", 0),
                              ],
                            ),
                            SizedBox(height: 15,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Column(
                children: [
                  _buildRowItem(Icons.card_giftcard, Colors.red, "Gift card"),
                  _buildRowItem(Icons.branding_watermark_rounded, Colors.yellow.shade600, "Bank card"),
                  _buildRowItem(Icons.calendar_view_month_rounded, Colors.orangeAccent, "Replacement code"),
                  _buildRowItem(Icons.collections, Colors.blue, "Consulting collection"),
                  _buildRowItem(Icons.person, Colors.yellow.shade600, "Customer service"),
                ],
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
              color: Colors.grey,
              iconSize: 40,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_outline), 
              color: Colors.yellow,
              iconSize: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNav(Icon icon, String name) {
    return  Container(
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {}, 
                    color: Colors.white,
                    iconSize: 40,
                    icon: icon,
                  ),
                  Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white)),
                ],
              ),
            );
  }

  Widget _buildCardDetail(String image, String name, int amount) {
    return  Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: EdgeInsets.only(left: 10),
                height: 150,
                width: MediaQuery.of(context).size.width / 2 - 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Image.asset(image, fit: BoxFit.cover, height: 50, width: 80,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Container(
                        child: Text(name, style: TextStyle(fontFamily: "Quicksand", fontSize: 20,))
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Container(
                        child: Text("$amount", style: TextStyle(fontFamily: "Quicksand", fontSize: 20, fontWeight: FontWeight.bold, color: Colors.redAccent))
                      )
                    ),
                  ],
                ),
              ),
            );
  }

  Widget _buildRowItem(icon, Color color, String name) {
    return Material(
      elevation: 4,
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: color.withOpacity(0.3),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 25,
                  ),
                ),
                SizedBox(width: 20,),
                Text(name, style: TextStyle(fontFamily: "Quicksand", fontSize: 20),),
              ],
            ),
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}