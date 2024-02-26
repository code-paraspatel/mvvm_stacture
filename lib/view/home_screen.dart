import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:with_project_stucture/data/response/status.dart';
import 'package:with_project_stucture/resources/color.dart';
import 'package:with_project_stucture/resources/components/drawer.dart';
import 'package:with_project_stucture/utils/routes/routes_name.dart';
import 'package:with_project_stucture/utils/utils.dart';
import 'package:with_project_stucture/view_modal/auth_movies_modal.dart';
import 'package:with_project_stucture/view_modal/auth_user_account_modal.dart';
import 'package:with_project_stucture/view_modal/favorite_screen_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AuthMoviesListProvider>(context, listen: false)
          .moviesListProvider();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          backgroundColor: AppColor.blueColor,
          title: const Text(
            'Home Screen',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            const SizedBox(
              width: 30,
            ),
            Consumer<AuthUserAccountModal>(
              builder: (context, authUserAccountModal, child) {
                return InkWell(
                    onTap: () {
                      authUserAccountModal.removeUserData().then((value) {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.login);
                      });
                    },
                    child: const Text(
                      'LogOut',
                      style: TextStyle(fontSize: 15),
                    ));
              },
            )
          ],
        ),
        body: Consumer<AuthMoviesListProvider>(
          builder: (context, value, _) {
            switch (value.moviesApiResponse.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.COMPLETED:
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          // scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: value.moviesApiResponse.data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 2,
                                childAspectRatio: 0.7,
                                mainAxisSpacing: 6,
                                crossAxisSpacing: 6
                              ),
                          itemBuilder: (context, index) {
                            return Card(
                              color:
                                  index.isOdd ? Colors.yellow : Colors.pink,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    height: 150,
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          topLeft: Radius.circular(10)),
                                      child: Image(
                                        image: NetworkImage(value
                                            .moviesApiResponse
                                            .data![index]
                                            .posterurl
                                            .toString()),
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Icon(
                                            Icons.error,
                                            color: Colors.red,
                                          );
                                        },
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height *
                                            0.01,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 2),
                                    child: Text(
                                      value.moviesApiResponse.data![index]
                                          .title
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(Utils.avgRatting(value
                                                .moviesApiResponse
                                                .data![index]
                                                .ratings!)
                                            .toStringAsFixed(2)),
                                        const Icon(Icons.star)
                                      ],
                                    ),
                                  ),
                                  // Text(value.moviesApiResponse.data!.movies![index].actors.toString()),
                                  RichText(
                                      text: TextSpan(
                                          children: value.moviesApiResponse
                                              .data![index].actors!
                                              .map((e) {
                                    return TextSpan(text: '$e, ');
                                  }).toList())),
                                  Text(value
                                      .moviesApiResponse.data![index].year
                                      .toString()),
                                  Text(value.moviesApiResponse.data![index]
                                      .duration
                                      .toString()),
                                  Text(value
                                      .moviesApiResponse.data![index].id
                                      .toString()),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5, bottom: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Consumer<FavoriteScreenProvider>(
                                            builder: (context, fav, _) {
                                          return InkWell(
                                              onTap: () {
                                                if (fav.moviesId.contains(
                                                    value.moviesApiResponse
                                                        .data![index])) {
                                                  fav.removeMoviesId(value
                                                      .moviesApiResponse
                                                      .data![index]);
                                                } else {
                                                  fav.addMoviesId(value
                                                      .moviesApiResponse
                                                      .data![index]);
                                                }
                                              },
                                              child: fav.moviesId.contains(
                                                      value
                                                          .moviesApiResponse
                                                          .data![index])
                                                  ? const Icon(
                                                      Icons.favorite)
                                                  : const Icon(Icons
                                                      .favorite_border));
                                        }),
                                        const Icon(Icons.share)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              case Status.ERROR:
                return Text(value.moviesApiResponse.message.toString());
              default:
                return Container();
            }
          },
        ));
  }
}
