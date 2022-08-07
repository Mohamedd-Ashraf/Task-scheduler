// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/Strings.dart';
import 'package:flutter_application_1/data/models/chracters.dart';

class WebServices {

  late Dio dio;
WebServices(){
  BaseOptions options =BaseOptions(
    baseUrl: baseUrl,
    receiveDataWhenStatusError: true,
    receiveTimeout: 20 *1000,
    connectTimeout: 20*1000,
  );

  dio = Dio(options);

}
  
  Future<List<dynamic>> getAllCracters() async{

    try {
  Response response = await dio.get('characters');
  print(response.data.toString());
  return response.data;
} on Exception catch (e) {
  print(e);
  return [];
  // TODO
}

  }



}