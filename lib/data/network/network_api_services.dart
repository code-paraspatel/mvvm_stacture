

import 'dart:convert';
import 'dart:io';

import 'package:with_project_stucture/data/app_excaption/app_excaption.dart';
import 'package:with_project_stucture/data/network/base_api_services.dart';

import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices{


  @override
  Future getGetApiResponse(String url) async {

    dynamic responseJson;
   try{
     final response=await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
     responseJson=returnResponse(response);
   } on SocketException{
     throw FetchDataException('No Internet Connection');
   }
   return responseJson;
  }

  @override
  Future getPostApiResponse(String url,dynamic data) async {
    dynamic responseJson;
    try{
      final response = await http.post(
          Uri.parse(url),
          body: data
      ).timeout(const Duration(seconds: 10));
      responseJson=returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

   dynamic returnResponse(http.Response response){

    switch(response.statusCode){
      case 200:
        dynamic responseJson=jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        throw BadRequestException('Internet Error');
      case 404:
        throw UnauthorisedException(response.body.toString());
      default :
        throw FetchDataException('Error accured While communication with server' +
            'with status code'+response.statusCode.toString());

    }
   }
}