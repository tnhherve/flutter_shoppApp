import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

// Private importation
import '../components/horizontal_listview.dart';
import '../components/products.dart';
import 'cart.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    Widget image_carousel = new Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          Image.asset("Images/Produit/chemise1.jpg",fit: BoxFit.cover,),
          Image.asset("Images/Produit/cuire.jpg",fit: BoxFit.cover,),
          Image.asset("Images/Produit/blaser.jpg",fit: BoxFit.cover,),
          Image.asset("Images/Produit/sneaker1.jpg",fit: BoxFit.cover,),
          Image.asset("Images/Produit/tshirt1.jpg",fit: BoxFit.cover,),
          Image.asset("Images/Produit/veste.jpg",fit: BoxFit.cover,),
          Image.asset("Images/Produit/sac4.jpg", fit: BoxFit.cover,),
        ],
        autoplay: false,
//        animationCurve: Curves.fastOutSlowIn,
//        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.red,
          title: Text('ShopApp'),
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: null),
            new IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context)=>(
                      new Cart()
                  )));
                }),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text("Herve"),
                accountEmail: Text("tnhherve@gmail.com"),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Colors.pink
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.red),
                title: Text("Home Page"),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.account_circle, color: Colors.red),
                title: Text("My acount"),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket, color: Colors.red),
                title: Text("My orders"),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart, color: Colors.red),
                title: Text("Shopping cart"),
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context)=>(
                      new Cart()
                  )));
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite, color: Colors.red),
                title: Text("Favorites"),
                onTap: (){},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.blue),
                title: Text("settings"),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.help, color: Colors.green,),
                title: Text("About"),
                onTap: (){},
              ),
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            // image Carousel
            image_carousel,
            //Padding Widget
            new Padding(
              padding: const EdgeInsets.all(8),
              child: Text("Category", style: TextStyle(fontWeight: FontWeight.bold),),
            ),

            // Horizontal listview
            HorizontalList(),

            //Padding
            new Padding(
              padding: const EdgeInsets.all(8),
              child: Text("Recent products",style: TextStyle(fontWeight: FontWeight.bold),),
            ),

            // GridView
            new Container(
              height: 380.0,
              child: Products(),
            )
          ],
        )
    );
  }
}