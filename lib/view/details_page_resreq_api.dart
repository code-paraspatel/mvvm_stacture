
import 'package:flutter/material.dart';
import 'package:with_project_stucture/data/modal/resreq_api_modal.dart';

class DetailsPageResReqApi extends StatefulWidget {
  const DetailsPageResReqApi({super.key});
  @override
  State<DetailsPageResReqApi> createState() => _DetailsPageResReqApiState();
}
class _DetailsPageResReqApiState extends State<DetailsPageResReqApi> {
  @override
  Widget build(BuildContext context) {
    final arg= ModalRoute.of(context)?.settings.arguments as Data;
    return Scaffold(
      appBar: AppBar(
        title: Text(arg.firstName?.toString() ?? 'First Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(image: NetworkImage(arg.avatar?.toString() ?? 'No Image'),
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error,color: Colors.red,);
                },
                fit: BoxFit.fill,
               height: 300,
               width: double.infinity,),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Text('Name: ${arg.firstName}${arg.lastName}'),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Text('Email: ${arg.email}'),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Text('Id: ${arg.id}'),
          ],
        ),
      ),
    );
  }
}
