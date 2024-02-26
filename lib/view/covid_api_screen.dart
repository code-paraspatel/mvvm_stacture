import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:with_project_stucture/data/response/status.dart';
import 'package:with_project_stucture/view_modal/auth_covid_api_modal.dart';
import 'package:with_project_stucture/view_modal/auth_dummyjson_api_modal.dart';

class CovidApiScreen extends StatefulWidget {
  const CovidApiScreen({super.key});

  @override
  State<CovidApiScreen> createState() => _CovidApiScreenState();
}

class _CovidApiScreenState extends State<CovidApiScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AuthCovidApi>(context,listen: false).getCovidApi();
    });
  }
  @override
  Widget build(BuildContext context) {
    //  Provider.of<AuthDummyJsonApiProvider>(context,listen: false).dummyJsonApiGet();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Covid  Countries Api'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<AuthCovidApi>(
                builder: (context, value, _) {
                  switch(value.apiResponse.status){
                    case Status.LOADING:
                      return const Center(child: CircularProgressIndicator(),);
                    case Status.ERROR:
                      return Text(value.apiResponse.message.toString());
                    case Status.COMPLETED:
                      return ListView.builder(
                        itemCount: value.apiResponse.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(value.apiResponse.data![index].countryInfo!.flag.toString()),
                              ),
                              title: Text(value.apiResponse.data![index].country.toString()),
                              subtitle: Text(value.apiResponse.data![index].cases.toString()),
                              trailing: Text(value.apiResponse.data![index].population.toString()),
                            );
                          },);
                    default :
                      return Container();
                  }
                }
            ),
          ),
        ],
      ),
    );
  }
}