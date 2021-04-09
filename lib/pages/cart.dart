
import 'package:flutter/material.dart';

import 'package:shopapp_tuto/components/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.red,
        title: Text("Shopping cart"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search, color: Colors.white,),
              onPressed: (){
              })
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: new Text("Total:"),
                subtitle: new Text("\$348"),
              ),
            ),
            Expanded(
              child: new MaterialButton(onPressed: (){},
                color: Colors.red,
                child: new Text("Check out", style: TextStyle(color: Colors.white),) ,),

            )
          ],
        )
      ),
      body: new Cart_products(),
    );
  }
}
