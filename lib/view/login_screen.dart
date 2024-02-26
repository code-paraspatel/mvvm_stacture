import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:with_project_stucture/resources/color.dart';
import 'package:with_project_stucture/resources/components/elevated_button.dart';
import 'package:with_project_stucture/utils/routes/routes_name.dart';
import 'package:with_project_stucture/utils/utils.dart';
import 'package:with_project_stucture/view_modal/auth_view_modal.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _obsecureValue=ValueNotifier<bool>(true);
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  FocusNode emailFocus=FocusNode();
  FocusNode passwordFocus=FocusNode();



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _obsecureValue.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModal>(
      builder: (context, authViewModal, child) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.blueColor,
              title:  const Text('Login Page',style: TextStyle(color:AppColor.whiteColor,fontSize: 18),),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      focusNode: emailFocus,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.alternate_email),
                          hintText: 'Email',
                          labelText: 'Email',
                          border: OutlineInputBorder()
                      ),
                      onFieldSubmitted: (value) {
                        //FocusScope.of(context).requestFocus(passwordFocus);
                        Utils.fieldFocusChanger(context, emailFocus, passwordFocus);
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                    ValueListenableBuilder(
                      valueListenable: _obsecureValue,
                      builder: (context, value, child) {
                        return TextFormField(
                          controller: passwordController,
                          focusNode: passwordFocus,
                          obscureText: _obsecureValue.value,
                          obscuringCharacter: '*',
                          decoration:  InputDecoration(
                            prefixIcon: const Icon(Icons.lock_open_outlined),
                            hintText: 'Password',
                            labelText: 'Password',
                            suffixIcon: InkWell(
                                onTap: () {
                                  _obsecureValue.value=!_obsecureValue.value;
                                },
                                child: Icon(
                                    _obsecureValue.value ? Icons.visibility_off_sharp:
                                    Icons.visibility
                                )),
                            border: const OutlineInputBorder(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                    MyElevatedButton(
                      loading: authViewModal.loading,
                      title: 'Login',
                      onPress: () {
                        if(emailController.text.isEmpty){
                          Utils.flushBar(context, 'Enter Your Email');
                        }else if(passwordController.text.isEmpty){
                          Utils.snackBar(context, 'Enter your Password');
                        }else if(passwordController.text.length<6){
                          Utils.flushBar(context, 'Password 6 digit Enter ');
                        }else{
                          Map data= {
                            'email' : emailController.text,
                            'password': passwordController.text
                          };
                          authViewModal.loginApi(data,context).then((value) {
                            if (kDebugMode) {
                              print('api hit');
                            }
                          });
                        }
                      },),
                    SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                     InkWell(
                       onTap: () {
                          Navigator.pushNamed(context, RoutesName.singUp);
                       },
                        child: const Text("Don't have an account? Sign Up"))
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}
