import 'package:flutter/material.dart';
import 'package:trendler3/constant.dart';


import 'package:trendler3/public/product.dart';


class itemCard extends StatelessWidget {
  final Product product;
  final VoidCallback press;
  const itemCard({
    Key key,
    @required this.product,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: press,
        child: Material(
           color: kButtonColor,
              borderRadius: BorderRadius.circular(16),
              elevation: 4,
              shadowColor: Colors.grey.shade300,
          child: Container(
            padding: EdgeInsets.all(kDefaultPaddin),
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
              product.image,
            ),
                ),
        
        
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin/4 ),
              child: Text(product.name,
              style: TextStyle(color: kTextColor, fontSize: 16)),
            ),
        
        
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin/4),
              child: Text(product.desc,textAlign: TextAlign.center,
          style: TextStyle(color: kTextLightColor, fontSize: 14)),
            )
            
              ],
            )
            
            
          ),
        ),
      ),
    );
  }
}



