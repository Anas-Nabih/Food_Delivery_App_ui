import 'package:flutter/material.dart';

class FoodTab extends StatefulWidget {
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildListItem("Delicious Hot Dog", 'images/hot_dog.png', 4.0 , '6' ),
          SizedBox(height: 10,),
          _buildListItem("Cheese Pizza", 'images/pizza.png', 4.0 , '8' ),
          SizedBox(height: 10,),
          _buildListItem("Ice Tea", 'images/ice_tea.png', 4.0 , '4' ),
        ],
      ),
    );
  }
}
_buildListItem(String foodname, String imgpath ,double r, String price) {
  return Padding(
    padding: EdgeInsets.only(left: 15, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0XFFFFE3DF)
                ),
                child: Image.asset(imgpath, width: 50,height: 50,)
            ),
          ],
        ),
        // SizedBox(width: 20,),
        Column(
          children: <Widget>[
            Row(
            //  crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(foodname,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                  ),),
              ],
            ),
           // SizedBox(height: 5,),
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.star,color: Color(0XFFFFD700),),
                    Icon(Icons.star,color: Color(0XFFFFD700),),
                    Icon(Icons.star,color: Color(0XFFFFD700),),
                    Icon(Icons.star,color: Color(0XFFFFD700),),
                  ],
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text('\$' + price,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.red
                  ),
                ),
                SizedBox(width: 5,),
                Text('\$' + '10',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey.withOpacity(0.4)
                  ),
                ),

              ],
            )
          ],
        ),
        //SizedBox(width: 100,),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Column(
            children: <Widget>[
              FloatingActionButton(
                mini: true,
                // heroTag: foodname,
                onPressed: (){},
                backgroundColor: Color(0XFFFE7D6A),
                child: Center(
                  child: Icon(Icons.add, color: Colors.white,),
                ),
              )
            ],
          ),
        )
      ],
    ),

  );
}

