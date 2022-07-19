import 'package:flutter/material.dart';
import 'package:trendler3/components/item_Card.dart';
import 'package:trendler3/constant.dart';
import 'package:trendler3/public/product.dart';
import 'package:trendler3/screens/components/detalis_screns.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: [
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
                itemCount: product.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // mainAxisSpacing: kDefaultPaddin,
                    childAspectRatio: 0.75),

                    
                //diğer sayfaya yönlendirme işlemi burda oluyor
                itemBuilder: (context, index) => itemCard(
                    product: product[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreens(product: product[index])))), 
              ),
            ),
          ),
        ],
      ),
    );
  }
}

