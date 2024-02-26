import 'package:flutter/material.dart';
import 'package:with_project_stucture/resources/color.dart';

class MyElevatedButton extends StatelessWidget {

  final String title;
  final VoidCallback onPress;
  final bool loading;

  const MyElevatedButton({super.key,
    required this.title,
    required this.onPress,
     this.loading=false});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: AppColor.blueColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child:loading ? const CircularProgressIndicator() :
        Text(title,style: const TextStyle(color: AppColor.whiteColor,fontSize: 18),)
        ),
      ),
    );
  }
}
