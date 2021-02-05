import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BurgerPage extends StatefulWidget {
  final imgPath, foodName, pricePerItem, heroTag;

  BurgerPage({this.imgPath, this.foodName, this.pricePerItem, this.heroTag});

  @override
  _BurgerPageState createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  var netprice = 0.0;
  var quantity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 45,
                      width: 45,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0XFFFE7D6A),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0XFFFE7D6A).withOpacity(0.3),
                              blurRadius: 6.0,
                              spreadRadius: 4,
                              offset: Offset(0.0, 0.4),
                            )
                          ]),
                      child: Center(
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 1,
                      right: 4,
                      child: Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyle(color: Colors.red, fontSize: 7),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Super',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.w800),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              widget.foodName.toString().toUpperCase(),
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new FloatingActionButton(
                onPressed: (){},
                child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(widget.imgPath),
                      fit: BoxFit.contain,
                    ))),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0XFFFE7D6A).withOpacity(0.3),
                                  blurRadius: 6,
                                  spreadRadius: 4,
                                  offset: Offset(5.0, 11.0))
                            ]),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: Color(0XFFFE7D6A),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0XFFFE7D6A).withOpacity(0.3),
                                  blurRadius: 6,
                                  spreadRadius: 4,
                                  offset: Offset(5.0, 11.0))
                            ]),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Icon(
                            Icons.restore,
                            color: Color(0XFFFE7D6A),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 70,
                width: 125,
                color: Colors.white,
                child: Center(
                  child: Text(
                    '\$' +
                        (int.parse(widget.pricePerItem) * quantity).toInt().toString(),
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        color: Color(0XFF5E6166)),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 225,
                decoration: BoxDecoration(
                    color: Color(0XFFFE7D6A),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                       // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            iconSize: 17,
                            icon: Icon(
                              Icons.add,
                              color: Color(0XFFFE7DA6),
                            ),
                            onPressed: () {
                              adjustQuantity('PLUS');
                            },
                          ),
                          Text(
                            quantity.toInt().toString(),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0XFFEF7D6a)),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.remove,
                                color: Color(0XFFEF7DA6),
                              ),
                              iconSize: 17,
                              onPressed: () {
                                adjustQuantity('MINUS');
                              })
                        ],
                      ),
                    ),
                    Text('Add to cart',
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.white),)
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('FEATURED',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                _buildListItem('images/pepsi.png','Pepsi', '5',Color(0XFFEF7D5A),),
                SizedBox(height: 30,),
                _buildListItem('images/pcorn.png','Pop Corn', '4',Color(0xFFC2E3FE),),
                SizedBox(height: 30,),
                _buildListItem('images/scorn.png','Sweet Corn', '6',Color(0xFFD7FADA),),
                SizedBox(height: 30,),
                _buildListItem('images/lp.png','Lollipop', '3',Color(0xFFC2D3FE),),
                SizedBox(height: 30,),
                _buildListItem('images/cho.png','Sweet Corn', '7',Color(0xFFC2E3FE),),
                 SizedBox(height: 30,),
                _buildListItem('images/cpc.png','Sweet Corn', '9',Color(0xFFD7FADA),),

              ],
            ),
          )
        ],
      ),
    );
  }

  _buildListItem(String imgPath, String foodName, String price , Color bgcolor){
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: bgcolor,
                ),
                child: Image.asset(imgPath,width:50 ,height: 50,),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(foodName,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Text('\$'+ price,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17, color: Colors.red),
                  )
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              FloatingActionButton(
                onPressed: (){},
                mini: true,
                backgroundColor: Color(0XFFFE7D6A),
                child: Icon(Icons.add),

              )
            ],
          )
        ],
      ),
    );
  }
  adjustQuantity(pressed){
    switch(pressed){
      case'PLUS':
        setState(() {
          quantity +=1 ;
        });
        return;
      case'MINUS':
        if(quantity != 0)
          {
            setState(() {
              quantity -=1;
            });
          }
        return;
    }
  }
}
