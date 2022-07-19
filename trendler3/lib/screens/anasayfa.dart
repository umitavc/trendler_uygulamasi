import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:trendler3/app/init/network_manager.dart';
import 'package:trendler3/components/body.dart';
import 'package:trendler3/constant.dart';
import 'package:trendler3/screens/components/iconYonlendirme.dart';
import 'package:trendler3/public/hakkimizda.dart';

class anasayfa extends StatefulWidget {
  const anasayfa({Key key}) : super(key: key);

  @override
  State<anasayfa> createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {
  final String _title = 'Trendler';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }
  

  AppBar buildAppBar() {
    return AppBar(
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          _title,
          style: Theme.of(context).textTheme.headline5,
        ),
        IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => iconYon(hakkimizda: hakkimizda[0])));
            },
            icon: const Icon(
              Icons.error_outline,
              color: kTextColor,
              size: 36,
            )),
      ]),
    );
  }
}
