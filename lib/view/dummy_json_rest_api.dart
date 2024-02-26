import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:with_project_stucture/data/response/status.dart';
import 'package:with_project_stucture/view_modal/auth_dummyjson_api_modal.dart';

class DummyJsonRestApi extends StatefulWidget {
  const DummyJsonRestApi({super.key});

  @override
  State<DummyJsonRestApi> createState() => _DummyJsonRestApiState();
}

class _DummyJsonRestApiState extends State<DummyJsonRestApi> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AuthDummyJsonApiProvider>(context,listen: false).dummyApiGetDio();
    });
  }
  @override
  Widget build(BuildContext context) {
   //  Provider.of<AuthDummyJsonApiProvider>(context,listen: false).dummyJsonApiGet();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Json Api'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<AuthDummyJsonApiProvider>(
              builder: (context, value, _) {
                switch(value.apiResponse.status){
                  case Status.LOADING:
                    return const Center(child: CircularProgressIndicator(),);
                  case Status.ERROR:
                    return Text(value.apiResponse.message.toString());
                  case Status.COMPLETED:
                    return const Text('paras');
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
