import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  String name;
  bool isFavorite;
  String description;
  double price;
  DetailPage({ required this.name, required this.isFavorite, required this.description, required this.price });

  @override
  _DetailPageState createState() => _DetailPageState(name: name, isFavorite: isFavorite, description: description, price: price);
}

class _DetailPageState extends State<DetailPage> {
  String name;
  bool isFavorite;
  String description;
  double price;
  _DetailPageState({ required this.name, required this.isFavorite, required this.description, required this.price });

  int photoIndex = 0;
  List<String> photoList = [
    "images/Sofa1.png",
    "images/Sofa2.png",
    "images/Sofa3.png",
  ];

  void previousImage() {
    setState(() {
      photoIndex = (photoIndex > 0) ? (photoIndex - 1) : (photoList.length - 1);
    });
  }

  void nextImage() {
    setState(() {
      photoIndex = (photoIndex < photoList.length - 1) ? (photoIndex + 1) : 0;
    });
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(photoList[photoIndex]), fit: BoxFit.contain),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                    ),
                    onTap: nextImage,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width / 2,
                      color: Colors.transparent,
                    ),
                    onTap: previousImage,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          }, 
                          icon: Icon(Icons.arrow_back),
                        ),
                        Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(child: isFavorite ? Icon(Icons.favorite, color: Colors.red, size: 15,) : Icon(Icons.favorite, color: Colors.grey, size: 15,),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: MediaQuery.of(context).size.width / 2 - ((photoList.length - 1) * 10),
                    child: Row(
                      children: [
                        SelectedPhoto(numberOfDots: photoList.length, photoIndex: photoIndex),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Alcide Number: 2323X", style: TextStyle(fontSize: 15, color: Colors.grey),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(description, style: TextStyle(fontSize: 12, color: Colors.grey),)
                    ),
                    SizedBox(width: 20,),
                    Text("\$ $price", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Colour", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    _buildColors(Colors.brown),
                    _buildColors(Colors.blue),
                    _buildColors(Colors.yellow),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Material", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    _buildMaterial("images/wood.png", 10),
                    _buildMaterial("images/fabric.png", 60),
                    _buildMaterial("images/wood.png", 30),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 5,
        color: Colors.white,
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(width: 15),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.white,
                  child: Icon(Icons.shopping_cart, color: Colors.grey, size: 40,),
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.white,
                  child: Icon(Icons.account_box, color: Colors.grey, size: 40,),
                ),
              ),
              SizedBox(width: 20),
              Container(
                color: Color(getColorHexFromStr("#FEDD59")),
                width: MediaQuery.of(context).size.width - 155,
                child: Center(child: Text("Add to cart", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.grey),),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColors(Color color) {
    return  Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: color
                  ),
                ),
              ),
            );
  }

  Widget _buildMaterial(String image, double percentage) {
    return  Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text("x$percentage%"),
                ],
              ),
            );
  }
}

class SelectedPhoto extends StatelessWidget {
  int numberOfDots;
  int photoIndex;

  SelectedPhoto({required this.numberOfDots, required this.photoIndex});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDotsImage(),
      ),
    );
  }

  Widget _inActiveDot() {
    return  Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                ),
              ),
            );
  }

  Widget _activeDot() {
    return  Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.yellow,
                  ),
                ),
              ),
            );
  }

  List<Widget> _buildDotsImage() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDots; i++) {
      dots.add(i == photoIndex ? _activeDot() : _inActiveDot());
    }
    return dots;
  }
}