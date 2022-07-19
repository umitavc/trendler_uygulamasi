import 'dart:async';
import 'dart:developer';
import 'dart:io';


import 'package:dio/dio.dart';


import 'package:flutter/foundation.dart';



class NetworkManager {
  Dio dio;
  static NetworkManager _instance;
  static NetworkManager get instance {
    if (_instance == null) _instance = NetworkManager._init();
    return _instance;
  }

  NetworkManager._init() {
    dio = Dio();
    dio.options.sendTimeout = 40000; //40s
    dio.options.receiveTimeout = 40000; //40s
    dio.options.contentType = 'application/json';
    dio.options.baseUrl = 'https://api.yazilimgo.com/trending/index.php';
    

    
  }

 
}


