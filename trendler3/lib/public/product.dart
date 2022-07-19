import 'package:flutter/material.dart';

class Product {
  final String image, name, desc,slug;
  final int id;

  //final Color color;

  Product({
    //required this.color,
    @required this.image,
    @required this.name,
    @required this.desc,
    @required this.id,
    @required this.slug
  });
}

List <Product> product =[
 Product(
  image: 'assets/images/google.png',
   name: 'Google', 
   desc: 'Popüler aramaları görüntele', 
   id: 1,
   slug: 'google',
  // color: Color(0xFFF8FAF8),
   ),
   Product(
  image: 'assets/images/youtube.png',
   name: 'YouTube', 
   desc: 'Popüler aramaları görüntele', 
   id: 2,
    slug: 'youtube',
  // color: Color(0xFFF8FAF8),
   ),
   Product(
  image: 'assets/images/twitter.png',
   name: 'Twitter', 
   desc: 'Popüler aramaları görüntele', 
   id: 3,
    slug: 'twitter',
  // color: Color(0xFFF8FAF8),
   ),
   Product(
  image: 'assets/images/newspaper.png',
   name: 'Haberler', 
   desc: 'Popüler aramaları görüntele', 
   id: 3,
    slug: 'news',
   //color: Color(0xFF05B305),
   ),
   Product(
  image: 'assets/images/drop.png',
   name: 'Ekşi Sözlük', 
   desc: 'Popüler aramaları görüntele', 
   id: 3,
    slug: 'eksi',
   //color: Color(0xFFF8FAF8),
   ),
   Product(
  image: 'assets/images/reddit.png',
   name: 'Reddit', 
   desc: 'Popüler aramaları görüntele', 
   id: 3,
    slug: 'reddit',
   //color: Color(0xFFF8FAF8),
   ),
];






