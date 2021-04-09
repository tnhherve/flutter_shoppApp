import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageCaption: 'T-Shirt',
            imageLocation: 'Images/Icons/tshirt2.png',
          ),
          Category(
            imageCaption: 'Jeans',
            imageLocation: 'Images/Icons/pantalon2.png',
          ),
          Category(
            imageCaption: 'Robes',
            imageLocation: 'Images/Icons/robe1.png',
          ),
          Category(
            imageCaption: 'Vestes',
            imageLocation: 'Images/Icons/blazer1.png',
          ),
          Category(
            imageCaption: 'Chemise',
            imageLocation: 'Images/Icons/chemise1.png',
          ),
          Category(
            imageCaption: 'Sneakers',
            imageLocation: 'Images/Icons/sneaker.png',
          ),
          Category(
            imageCaption: 'Boxer',
            imageLocation: 'Images/Icons/boxers1.png',
          ),
          Category(
            imageCaption: 'Sacs',
            imageLocation: 'Images/Icons/back1.png',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  // Constructeur

  Category({
   this.imageLocation,
   this.imageCaption
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 100.0,
          height: 80.0,
          child: ListTile(
            title: Image.asset(imageLocation, color: Colors.red, height: 50,fit: BoxFit.contain,),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(imageCaption, style: TextStyle(fontSize: 12),),
            )
          ),
        ),
      ),
    );
  }
}

