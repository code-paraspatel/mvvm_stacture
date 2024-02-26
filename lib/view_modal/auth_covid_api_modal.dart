


import 'package:flutter/cupertino.dart';
import 'package:with_project_stucture/data/modal/covid_api_modal.dart';
import 'package:with_project_stucture/data/response/api_response.dart';
import 'package:with_project_stucture/respository/covid_api_repository.dart';

class AuthCovidApi extends ChangeNotifier{

 var _myRepo = CovidApiRepository();

 ApiResponse<List<CovidApiModal>> apiResponse=ApiResponse.loading();

 setApiResponse(ApiResponse<List<CovidApiModal>> response){
   apiResponse=response;
   notifyListeners();
 }

 Future getCovidApi()async{
   setApiResponse(ApiResponse.loading());
   _myRepo.covidApiRepo().then((value) {
     setApiResponse(ApiResponse.completed(value));
   }).onError((error, stackTrace) {
     setApiResponse(ApiResponse.error(error.toString()));
   });
 }

}