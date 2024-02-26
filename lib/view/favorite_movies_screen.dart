import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:with_project_stucture/data/response/status.dart';
import 'package:with_project_stucture/resources/color.dart';
import 'package:with_project_stucture/utils/utils.dart';
import 'package:with_project_stucture/view_modal/auth_movies_modal.dart';
import 'package:with_project_stucture/view_modal/favorite_screen_provider.dart';

class FavoriteMovies extends StatefulWidget {
  const FavoriteMovies({super.key});

  @override
  State<FavoriteMovies> createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {

  @override
  Widget build(BuildContext context) {
    //final moviesList=Provider.of<FavoriteScreenProvider>(context,listen: false);
    return  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          backgroundColor: AppColor.blueColor,
          title: const Text('Favorite Movies',style: TextStyle(fontSize: 18),),
        ),
        body:SingleChildScrollView(
          child: Container(
            color: Colors.black87,
            child: Consumer2<AuthMoviesListProvider,FavoriteScreenProvider>(
              builder: (context, authMoviesListProvider,favoriteScreenProvider,_) {
                switch(authMoviesListProvider.moviesApiResponse.status){
                  case Status.LOADING:
                    return const Center(child: CircularProgressIndicator());
                  case Status.COMPLETED:
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 350,
                              width: MediaQuery.of(context).size.width*1,
                              child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount:favoriteScreenProvider.moviesId.length,
                                gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                                  //mainAxisSpacing: 15,
                                  //  childAspectRatio: 15,
                                  maxCrossAxisExtent: 350,
                                  mainAxisExtent: MediaQuery.of(context).size.width*0.4,
                                ),
                                itemBuilder: (context, index) {
                                  return Card(
                                    color: index.isOdd ? Colors.yellow:Colors.pink,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                          height: 150,
                                          width: double.infinity,
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                                            child: Image(image: NetworkImage(favoriteScreenProvider.moviesId[index].posterurl.toString()),
                                              errorBuilder: (context, error, stackTrace) {
                                                return const Icon(Icons.error,color: Colors.red,);
                                              },
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height*0.01,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:5,right: 2),
                                          child: Text(favoriteScreenProvider.moviesId[index].title.toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            style: const TextStyle(fontSize: 16),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:5,right: 2),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(Utils.avgRatting(favoriteScreenProvider.moviesId[index].ratings!).toStringAsFixed(2)),
                                              const Icon(Icons.star)
                                            ],
                                          ),
                                        ),
                                        // Text(value.moviesApiResponse.data!.movies![index].actors.toString()),
                                        RichText(text: TextSpan(
                                            children: favoriteScreenProvider.moviesId[index].actors!.map((e) {
                                              return TextSpan(text: '$e, ');
                                            }).toList()
                                        )),
                                        Text(favoriteScreenProvider.moviesId[index].year.toString()),
                                        Text(favoriteScreenProvider.moviesId[index].duration.toString()),
                                        Text(favoriteScreenProvider.moviesId[index].id.toString()),
                                        const Spacer(),
                                         Padding(
                                          padding: const EdgeInsets.only(left: 5,right: 5,bottom: 5),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                              onTap: () {
                                                  if(favoriteScreenProvider.moviesId.contains(favoriteScreenProvider.moviesId[index])){
                                                    favoriteScreenProvider.removeMoviesId(favoriteScreenProvider.moviesId[index]);
                                                  }else{
                                                    favoriteScreenProvider.addMoviesId(favoriteScreenProvider.moviesId[index]);
                                                  }
                                                     },
                                                         child:favoriteScreenProvider.moviesId.contains(favoriteScreenProvider.moviesId[index])?const Icon(Icons.favorite):const Icon(Icons.favorite_border)),
                                                    const Icon(Icons.share)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                  },)),
                        ],
                      ),
                    );
                  case Status.ERROR :
                    return Text(authMoviesListProvider.moviesApiResponse.message.toString());
                  default :
                    return Container();
                }

              },
            ),
          ),
        )
    );
  }
}
