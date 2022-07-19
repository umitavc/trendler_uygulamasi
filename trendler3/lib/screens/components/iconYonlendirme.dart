import 'package:flutter/material.dart';
import 'package:trendler3/constant.dart';
import 'package:trendler3/public/product.dart';
import 'package:trendler3/public/hakkimizda.dart';


class iconYon extends StatelessWidget {
  final String _title ='Bilgi';
  final Hakkimizda hakkimizda; 
  const iconYon({ Key key, @required this.hakkimizda }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        
        title: Text(_title),
        backgroundColor: kAppBarColor,
        leading: IconButton(onPressed: () =>Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios),),
      ),
      
      body: Column(
       
        children: [
          Padding(
            
            padding: const EdgeInsets.all(kDefaultPaddin),
            
            child: Container(
             child: Center(child: Text('Hakkımızda',style: Theme.of(context).textTheme.headline6,)),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPaddin),
              child: Text(hakkimizda.aciklama,style: Theme.of(context).textTheme.bodyText2,),
            ),
            ),
          
        ],
      )
      
    );
  }
}

