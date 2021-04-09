import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {

  var product_list = [
    {
      "name": "Heris",
      "picture": "Images/Produit/sneaker.jpg",
      "price": 201,
      "size": "M",
      "color": "Red",
      "quantity": 1
    },
    {
      "name": "robettes",
      "picture": "Images/Produit/robes2.jpg",
      "price": 80,
      "size": "9",
      "color": "Black",
      "quantity": 1
    },

  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: product_list.length,
        itemBuilder: (context, index){
          return Single_cart_Products(
            card_prod_name: product_list[index]["name"],
            card_prod_picture: product_list[index]["picture"],
            card_prod_price: product_list[index]["price"],
            card_prod_size: product_list[index]["size"],
            card_prod_color: product_list[index]["color"],
            card_prod_quantity: product_list[index]["quantity"],
          );
        });
  }
}

class Single_cart_Products extends StatelessWidget {

  final card_prod_name;
  final card_prod_picture;
  final card_prod_price;
  final card_prod_size;
  final card_prod_color;
  final card_prod_quantity;

  Single_cart_Products({
    this.card_prod_name,
    this.card_prod_picture,
    this.card_prod_price,
    this.card_prod_size,
    this.card_prod_color,
    this.card_prod_quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(
        dense: true,
        leading: new Image.asset(card_prod_picture, width: 80.0, height: 100,),
        title: new Text(card_prod_name),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(card_prod_size,style: TextStyle(color: Colors.red)),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 8.0, 8.0, 8.0),
                  child: new Text("color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(card_prod_color, style: TextStyle(color: Colors.red),),
                ),
//                Padding(
//                  padding: const EdgeInsets.fromLTRB(8.0, 5.0, 1.0, 5.0),
//                  child: new Text("qty:"),
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: new Text("${card_prod_quantity}", style: TextStyle(color: Colors.red),),
//                ),
              ],
            ),
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$${card_prod_price}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.red),),
            )
          ],
        ),
        trailing: new Column(
          children: <Widget>[
            new IconButton(icon: new Icon(Icons.arrow_drop_up), onPressed: (){}),
            new IconButton(icon: new Icon(Icons.arrow_drop_down), onPressed: (){}),
          ],
        ),
      ),
    );
  }
}

