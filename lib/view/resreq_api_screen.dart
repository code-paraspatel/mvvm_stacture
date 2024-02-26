
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:with_project_stucture/data/response/status.dart';
import 'package:with_project_stucture/resources/color.dart';
import 'package:with_project_stucture/utils/routes/routes_name.dart';
import 'package:with_project_stucture/view_modal/auth_resreq_api_modal.dart';

class ResReqApi extends StatefulWidget {
  const ResReqApi({super.key});

  @override
  State<ResReqApi> createState() => _ResReqApiState();
}

class _ResReqApiState extends State<ResReqApi> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AuthResReqApiProvider>(context,listen: false).authResReqApi();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true,
        backgroundColor: AppColor.blueColor,
        title: const Text('ResReq Api'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<AuthResReqApiProvider>(
        builder: (context, value, _) {
                switch(value.apiResponse.status){
                  case Status.LOADING:
                    return const Center(child: CircularProgressIndicator(),);
                  case Status.ERROR:
                    return Text(value.apiResponse.message.toString());
                  case Status.COMPLETED:
                    return ListView.builder(
                      itemCount: value.apiResponse.data!.data!.length,
                        itemBuilder:(context, index) {
                          return ListTile(
                            onTap: (){
                              Navigator.pushNamed(context,
                                  RoutesName.detailsPageResReqApi,
                                  arguments:value.apiResponse.data?.data?[index]?? '',
                              );
                            },
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(value.apiResponse.data!.data![index].avatar.toString()),
                            ),
                            title: Text(value.apiResponse.data!.data![index].firstName.toString()),
                            subtitle: Text(value.apiResponse.data!.data![index].email.toString()),
                            trailing: Text(value.apiResponse.data!.data![index].id.toString()),
                          );
                        }, );
                  default :
                    return Container();
                }
              },
      ),
    );
  }
}
