import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shopapp_tuto/pages/products_detail.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  var product_list = [
    {
      "name": "Sac à dos ",
      "picture": "Images/Produit/sac.jpg",
      "old_price": 129,
      "price": 80,
    },
    {
      "name": "T-shirt",
      "picture": "Images/Produit/tshirt1.jpg",
      "old_price": 129,
      "price": 80,
    },
    {
      "name": "Chemise",
      "picture": "Images/Produit/chemise2.jpg",
      "old_price": 129,
      "price": 80,
    },
    {
      "name": "sneaker",
      "picture": "Images/Produit/sneaker1.jpg",
      "old_price": 239,
      "price": 189,
    },
    {
      "name": "Veste",
      "picture": "Images/Produit/veste2.jpg",
      "old_price": 129,
      "price": 110,
    },
    {
      "name": "Chemise bio",
      "picture": "Images/Produit/chemise.jpg",
      "old_price": 129,
      "price": 80,
    },
    {
      "name": "Jeans",
      "picture": "Images/Produit/jeans.jpg",
      "old_price": 129,
      "price": 80,
    },
    {
      "name": "Heris",
      "picture": "Images/Produit/sneaker.jpg",
      "old_price": 229,
      "price": 201,
    },
    {
      "name": "robettes",
      "picture": "Images/Produit/robes2.jpg",
      "old_price": 129,
      "price": 80,
    },
    {
      "name": "Veston",
      "picture": "Images/Produit/veste1.jpg",
      "old_price": 129,
      "price": 500,
    },
    {
      "name": "AirMax",
      "picture": "Images/Produit/airmax.jpg",
      "old_price": 129,
      "price": 290,
    },
    {
      "name": "trico",
      "picture": "Images/Produit/tshirt2.jpg",
      "old_price": 129,
      "price": 80,
    },
    {
      "name": "Deluxe",
      "picture": "Images/Produit/sac4.jpg",
      "old_price": 129,
      "price": 100,
    },
    {
      "name": "Pull",
      "picture": "Images/Produit/pull.jpg",
      "old_price": 129,
      "price": 50,
    },
    {
      "name": "Blaser",
      "picture": "Images/Produit/blaser.jpg",
      "old_price": 129,
      "price": 70,
    },
    {
      "name": "Sac a main",
      "picture": "Images/Produit/sac3.jpg",
      "old_price": 129,
      "price": 230,
    },
    {
      "name": "Diesel",
      "picture": "Images/Produit/jeans1.jpg",
      "old_price": 221,
      "price": 199,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        }
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(
          child: InkWell(
            onTap: ()=>
                Navigator.push(context,
                    //
                    new MaterialPageRoute(builder: (context)=> new ProductDetails(
                      prod_new_name: prod_name,
                      prod_new_picture: prod_picture,
                      prod_old_new_price: prod_old_price,
                      prod_new_price: prod_price,
                    ))),
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: Row(children: <Widget>[
                  Expanded(
                    child: Text(
                      prod_name,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Text("\$$prod_price", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                ],
                ),
              ),
              child: Image.asset(prod_picture, fit: BoxFit.cover,),
            ),
          ),
        ),
      )
    );
  }
}

