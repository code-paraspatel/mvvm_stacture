


import 'package:with_project_stucture/data/modal/resreq_api_modal.dart';
import 'package:with_project_stucture/data/network/base_api_services.dart';
import 'package:with_project_stucture/data/network/network_api_services.dart';
import 'package:with_project_stucture/resources/appurl.dart';

class ResReqApiRepository{

  final BaseApiServices _apiServices=NetworkApiServices();

  Future<ResReqApiModal> resReqApiData()async{
    try{
     dynamic response= await _apiServices.getGetApiResponse(AppUrl.resReqUrl);
     return response = ResReqApiModal.fromJson(response);
    }catch(e){
      throw(e.toString());
    }
  }
}