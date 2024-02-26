


import 'package:flutter/cupertino.dart';
import 'package:with_project_stucture/data/modal/resreq_api_modal.dart';
import 'package:with_project_stucture/data/response/api_response.dart';
import 'package:with_project_stucture/respository/resreq_api_repository.dart';

class AuthResReqApiProvider extends ChangeNotifier{

  final _myRepo=ResReqApiRepository();

  ApiResponse<ResReqApiModal> apiResponse=ApiResponse.loading();

  setApiResponse(ApiResponse<ResReqApiModal> response){
    apiResponse=response;
    notifyListeners();
  }
   authResReqApi ()async{
     setApiResponse(ApiResponse.loading());
      _myRepo.resReqApiData().then((value) {
        setApiResponse(ApiResponse.completed(value)
        );
      }).onError((error, stackTrace) {
        setApiResponse(ApiResponse.error(error.toString()));
      });
  }
}