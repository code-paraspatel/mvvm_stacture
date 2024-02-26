

import 'package:with_project_stucture/data/modal/covid_api_modal.dart';
import 'package:with_project_stucture/data/network/base_api_services.dart';
import 'package:with_project_stucture/data/network/network_api_services.dart';
import 'package:with_project_stucture/resources/appurl.dart';

class CovidApiRepository{

  final BaseApiServices _apiServices=NetworkApiServices();

  Future<List<CovidApiModal>> covidApiRepo() async {
    try{
    Iterable response = await  _apiServices.getGetApiResponse(AppUrl.covidApiUrl);
        return response=List<CovidApiModal>.from(response.map((e)=>CovidApiModal.fromJson(e))).toList();

    }catch(e){
      throw(e.toString());
    }
  }

}