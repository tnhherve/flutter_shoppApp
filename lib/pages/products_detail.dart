import 'package:flutter/material.dart';
import 'package:shopapp_tuto/main.dart';
import 'home.dart';

class ProductDetails extends StatefulWidget {
  final prod_new_name;
  final prod_new_picture;
  final prod_old_new_price;
  final prod_new_price;

  ProductDetails({
    this.prod_new_name,
    this.prod_new_picture,
    this.prod_old_new_price,
    this.prod_new_price,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 2.0,
        backgroundColor: Colors.red,
        title: InkWell(
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context)=>(new HomePage())));
          },
          child: Text("ShopApp")
        ),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: null),
          //new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: null),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 320.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.prod_new_picture)
              ),
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text(widget.prod_new_name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                    ),

                  ),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                            "\$${widget.prod_old_new_price}",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.lineThrough,
                            ),
                        ),
                      ),
                      Expanded(
                        child: new Text(
                            "\$${widget.prod_new_price}",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none,
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ========= The first bottons =========
          Row(
            children: <Widget>[
              // ========== The size botton ======
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("Size"),
                            content: Text("Choose the size"),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: (){
                                  Navigator.of(context).pop(context);
                                },
                                elevation: 2,
                                child: new Text("Close"),
                              )
                            ],
                          );
                        }
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 2.0,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Size"),),
                      Expanded(child: new Icon(Icons.arrow_drop_down),)
                    ],
                  ),
                ),
              ),
              // ========== The Color botton ======
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("Color"),
                            content: Text("Choose the color"),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: (){
                                  Navigator.of(context).pop(context);
                                },
                                elevation: 2,
                                child: new Text("Close"),
                              )
                            ],
                          );
                        }
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 2.0,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Color"),),
                      Expanded(child: new Icon(Icons.arrow_drop_down),)
                    ],
                  ),
                ),
              ),
              // ========== The Quantity botton ======
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("Quantity"),
                            content: Text("Choose the quantity"),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: (){
                                  Navigator.of(context).pop(context);
                                },
                                elevation: 2,
                                child: new Text("Close"),
                              )
                            ],
                          );
                        }
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 2.0,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Qty"),),
                      Expanded(child: new Icon(Icons.arrow_drop_down),)
                    ],
                  ),
                ),
              )
            ],
          ),

          // ========= The Second bottons =========
          Row(
            children: <Widget>[
              // ========== The size botton ======

              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text("Buy now")
                ),
              ),
              new IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.red,), onPressed: (){},),
              new IconButton(icon: Icon(Icons.favorite_border, color: Colors.red,), onPressed: (){},),
            ],
          ),
          Divider(),
          new ListTile(
            title: Text("Product details"),
            subtitle: new Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ips."),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product name", style: TextStyle(color: Colors.grey),),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.prod_new_name),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product brand", style: TextStyle(color: Colors.grey),),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("Brand X"),
              )
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product condition", style: TextStyle(color: Colors.grey),),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("NEW"),
              )
            ],
          ),
          Divider(),
          //Padding
          new Padding(
            padding: const EdgeInsets.all(8),
            child: Text("Similar products",style: TextStyle(fontWeight: FontWeight.bold),),
          ),

          // GridView
          new Container(
            height: 340.0,
            child: SimilarProduct(),
          )
        ],
      ),
    );
  }
}

class SimilarProduct extends StatefulWidget {
  @override
  _SimilarProductState createState() => _SimilarProductState();
}

class _SimilarProductState extends State<SimilarProduct> {

  var product_list = [
    {
      "name": "Sac à dos ",
      "picture": "Images/Produit/sac.jpg",
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
      "name": "trico",
      "picture": "Images/Produit/tshirt2.jpg",
      "old_price": 129,
      "price": 80,
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
          return Similar_Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        }
    );
  }
}

class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Similar_Single_prod({
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