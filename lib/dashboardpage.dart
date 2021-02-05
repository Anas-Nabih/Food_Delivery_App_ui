import 'package:flutter/material.dart';
import 'package:food_delivery_app/foodtabs.dart';
import 'package:food_delivery_app/burgerpage.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin {

  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController =TabController(vsync: this, length: 4);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.menu, color: Colors.black,),

                Container(
                  height: 45, width: 45,
                 // color: Colors.red,
                  decoration: BoxDecoration(
                    boxShadow:[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.30),
                        blurRadius: 6.0,
                        spreadRadius: 4.0,
                        offset: Offset(0.0, 3.0)
                      )
                    ],
                    color: Color(0xFFC6E7FE),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('images/face_person.png'),
                      fit: BoxFit.contain
                    )
                  ),
                )

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text('SEARCH FOR',
              style: TextStyle(
              fontSize: 27,
                fontWeight: FontWeight.w800,
                fontFamily: 'NotoSansJP',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('RECIPES',
            style: TextStyle(
              fontFamily: 'NotoSansJP',
              fontSize: 27,
            fontWeight: FontWeight.w800,
            ),
            ),
          ),
          SizedBox(height: 25,),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Container (
              padding:EdgeInsets.only(left: 5) ,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: 14
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                  prefixIcon: Icon(Icons.search, color: Colors.grey,)
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text('Recommended',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildListItem('Humburger', 'images/humburger.png', '21', Color(0xFFEFA9A0),  Color(0xFFFEE9A0)),
                  _buildListItem('Chips', 'images/french_f.png', '12', Color(0xFFC2E3FE),  Color(0xFF6A8CAA)),
                  _buildListItem('Dounts', 'images/don.png', '15', Color(0xFFD7FADA), Color(0xFF56CC7E))

                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: TabBar(
              controller: tabController,
            isScrollable: true,
            unselectedLabelColor: Colors.grey.withOpacity(0.5),
             labelStyle: TextStyle(color: Colors.black,  fontSize: 16, fontWeight: FontWeight.w700),
              labelColor: Colors.black,
              indicatorColor: Colors.transparent,

              tabs: <Widget>[
                Text('FEATURED'),
                Text('COMBO'),
                Text('FAVORITES'),
                Text('RECOMMENDED'),

              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 450,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                FoodTab(),
                FoodTab(),
                FoodTab(),
                FoodTab(),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildListItem (String foodname, String imgpath, String price, Color bgColor, Color textColor){
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute (
            builder: (context) =>
                BurgerPage(heroTag: foodname, foodName: foodname,imgPath: imgpath,pricePerItem: price,)
          ));
        },
        child: Container(
          height: 175,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: bgColor
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                  ),
                  child: Center(
                    child: Image.asset(imgpath, height: 50,width: 50,),
                  ),
                ),
              ),
               SizedBox(height: 25,),
              Text(foodname,
                style: TextStyle(
                    fontSize: 17,
                  color: textColor,
                ),
              ),
              Text('\$ '+ price,
                style: TextStyle(
                    fontSize: 17,
                  color: textColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
