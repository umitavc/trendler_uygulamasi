import 'package:flutter/material.dart';

class Hakkimizda{
   String aciklama;
   final int id;

  Hakkimizda({
    @required this.aciklama,
    @required this.id,
  });
}



List <Hakkimizda> hakkimizda=[
  Hakkimizda(
    id: 1,
   
    aciklama:'1998 yılında "En yeni iletişim ve bilgisayar teknolojilerini kullanarak müşterilerine dünya standartlarında çözümler sunmak" ilkesiyle yola çıkan isimtescil.net, geçen 16 yıllık süreçte Dünya ve Türkiye’ye, en büyük domain ve hosting firmalarından biri olmayı başarmıştır.',
    ),
];