

import 'package:flutter/cupertino.dart';
import 'package:with_project_stucture/data/modal/movies_list_modal.dart';
import 'package:with_project_stucture/data/response/api_response.dart';
import 'package:with_project_stucture/respository/movies_api_repository.dart';

class AuthMoviesListProvider extends ChangeNotifier{

  final _myRepo=MoviesListRepository();

  ApiResponse<List<Movies>> moviesApiResponse=ApiResponse.loading();

  setMoviesApiResponse(ApiResponse<List<Movies>> response){
    moviesApiResponse=response;
    notifyListeners();
  }

  List<Movies> _moviesList=[];
  List<Movies> get moviesList=>_moviesList;

  Future moviesListProvider()async{
    setMoviesApiResponse(ApiResponse.loading());
    _myRepo.moviesList().then((value) {
      _moviesList=value.movies==null?[]:value.movies!;
      setMoviesApiResponse(ApiResponse.completed(_moviesList));
    }).onError((error, stackTrace) {
      setMoviesApiResponse(ApiResponse.error(error.toString()));
    });
  }

}