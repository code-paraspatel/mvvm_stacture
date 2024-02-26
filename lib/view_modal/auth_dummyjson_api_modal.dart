




import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:with_project_stucture/data/modal/dummy_json_api_modal.dart';
import 'package:with_project_stucture/data/response/api_response.dart';
import 'package:with_project_stucture/respository/dummy_json_rest_api_repository.dart';
import 'package:dio/dio.dart';

class AuthDummyJsonApiProvider extends ChangeNotifier{
  final _myRepo=DummyJsonRepository();

  ApiResponse<List<Data>> apiResponse=ApiResponse.loading();

  setApiResponse(ApiResponse<List<Data>> response){
    apiResponse=response;
    notifyListeners();
  }

  // Future dummyJsonApiGet()async{
  //   setApiResponse(ApiResponse.loading());
  //   _myRepo.dummyJsonRepository().then((value) {
  //     setApiResponse(ApiResponse.completed(value));
  //   }).onError((error, stackTrace) {
  //     setApiResponse(ApiResponse.error(error.toString()));
  //   });
  // }

 Future<DummyJsonApiModal> dummyApiGetDio()async{
    setApiResponse(ApiResponse.loading());
  try{
    //final Uri url=Uri.parse('https://dummy.restapiexample.com/api/v1/employees');
    final response=await Dio().get('https://dummy.restapiexample.com/api/v1/employees');
    dynamic unknowData=jsonDecode(response.toString());
    if(response.statusCode==200){
      dynamic data=DummyJsonApiModal.fromJson(unknowData);
      setApiResponse(ApiResponse.completed(data));
      return data;
    }else{
      throw('error');
    }
  }catch(e){
    setApiResponse(ApiResponse.error(e.toString()));
    throw(e.toString());
  }
 }
}