import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trendler3/app/init/network_manager.dart';
import 'package:trendler3/constant.dart';

import 'package:trendler3/public/product.dart';
import 'package:trendler3/screens/components/trendlerYonlendirme.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreens extends StatefulWidget {
  final Product product;
  final VoidCallback press;
  const DetailScreens({Key key, @required this.product, this.press}) : super(key: key);

  @override
  State<DetailScreens> createState() => _DetailScreensState();
}

class _DetailScreensState extends State<DetailScreens> {
  bool isLoading = true;
  List trends = [];
  @override
  void initState() {
    getHome();
    super.initState();
  }

  void getHome() async {
    setState(() {
      isLoading = true;
    });
    print(widget.product.slug);
    await NetworkManager.instance.dio.get('?src=${widget.product.slug}').then((value) {
      Map<String, dynamic> json = value.data;

      setState(() {
        trends = json['trends'];
      });
      print(trends.length);
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kButtonColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.ac_unit, color: Colors.transparent),
          ),
        ],
        //centerTitle: true,
        backgroundColor: kAppBarColor,
        title: ListTile(
          title: Center(
            child: Text(
              widget.product.name,
              style: const TextStyle(color: kTitleColor, fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          subtitle: Center(
            child: Text(
              widget.product.desc,
              style: const TextStyle(color: kTitleLightColor, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kButtonColor,
              //size: 36,
            )),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: trends.length,
              itemBuilder: (BuildContext context, int index) {
                var i = trends.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 4,
                    shadowColor: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      title: Text(
                        widget.product.slug == 'google' ? i['title']["query"].toString() : i['title'].toString(),
                        maxLines: 1,
                      ),
                      subtitle: Text(
                        widget.product.slug == 'google' ? i['articles'][0]["snippet"].toString() : i['extra'].toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: Image.asset(
                        widget.product.image,
                        height: 42,
                      ),

                      //ShowModalBottom
                      onTap: () async {
                        if (widget.product.slug == 'google') {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            builder: (context) => Container(
                              height: 280,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4,
                                          ),
                                          child: Text(
                                            widget.product.slug == 'google' ? i['title']["query"].toString() : i['title'].toString(),
                                            style: Theme.of(context).textTheme.headline6,
                                          ),
                                        ),
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        widget.product.slug == 'google' ? i['articles'][0]["snippet"].toString() : i['extra'].toString(),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.subtitle1,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(8),
                                    child: SizedBox(
                                      height: 50,
                                      width: 360,
                                      child: ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: Icon(Icons.add_link),
                                        label: Text('Devamını Görüntüle'),
                                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                      ),
                                    ),
                                  ),
                                 /*  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(8),
                                    child: SizedBox(
                                      height: 50,
                                      width: 360,
                                      child: ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.close_rounded,
                                        ),
                                        label: const Text(
                                          'Kapat',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        style: ElevatedButton.styleFrom(primary: kTextLightColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                      ),
                                    ),
                                  ), */
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.blue,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(16),
                                      onTap: () {
                                        
                                      },
                                      child:
                                       Container(
                                        child: Center(child: Text('data')),
                                       // color: Colors.blue,
                                        height: 48,
                                        width: double.infinity,
                                      ),
                                    ),),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          if (!await launchUrl(Uri.dataFromString(
                            "http://eksisozluk.com/bogazi-dugumleyen-film-ya-da-dizi-sahnesi--7000479?",
                          ))) throw 'Could not launch';
                        }
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}




//title: Title(color: kTextColor, child: Text(product.name),),




 //leading: ElevatedButton(onPressed: (){}, child: Text('data') ,style: ElevatedButton.styleFrom(primary: kModalBottomColor),),


 /*ElevatedButton(
                                      onPressed: () {},
                                      child: Text('Devamını Görüntüle '),
                                      style: ElevatedButton.styleFrom(primary: kModalBottomColor,),
                                      
                                    ),
                                    ElevatedButton(onPressed: (){}, child: Text('x Kapat '))*/