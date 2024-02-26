

import 'package:flutter/cupertino.dart';
import 'package:with_project_stucture/data/modal/movies_list_modal.dart';

class FavoriteScreenProvider extends ChangeNotifier{


  List<Movies> _moviesId=[];
  List<Movies> get moviesId=>_moviesId;

  addMoviesId( Movies movies){
    _moviesId.add(movies);
    notifyListeners();
  }

  removeMoviesId(Movies movies){
    _moviesId.removeWhere((element) => element==movies);
    notifyListeners();
  }

}