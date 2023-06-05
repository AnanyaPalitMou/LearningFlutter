import 'package:flutter/material.dart';
import 'package:mvvm/resources/components/round_button.dart';
import 'package:mvvm/utils/general_utils.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  ValueNotifier<bool> _obsecurePassword=ValueNotifier<bool>(true);

  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  FocusNode emailFocusNode=FocusNode();
  FocusNode passwordFocusNode=FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode=Provider.of<AuthViewModel>(context);
    final height=MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login',
          style: TextStyle(fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold),),

        centerTitle: true,
        backgroundColor: Colors.blue[700],
      ),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: InputDecoration(
                hintText: 'Email',
                //labelText: 'EMAIL',
                //labelStyle: TextStyle(fontSize: 20),
                prefixIcon: Icon(Icons.email_rounded),

              ),
              onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
            SizedBox(height: 10,),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child){
                  return TextFormField(
                    controller: _passwordController,
                    focusNode: passwordFocusNode,
                    obscureText: _obsecurePassword.value,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: 'Password',
                      //labelText: 'PASSWORD',
                      //labelStyle: TextStyle(fontSize: 20),
                      prefixIcon: Icon(Icons.lock_open_rounded),
                      suffixIcon: InkWell(
                          onTap: (){
                            _obsecurePassword.value=!_obsecurePassword.value;
                          },
                          child: Icon(
                              _obsecurePassword.value? Icons.visibility_off_outlined:Icons.visibility)),

                    ),
                  );
                }),
            SizedBox(height: height*.1,),

            RoundButton(
                title: 'Login',
                loading: authViewMode.loading,
                onPress: (){
                  if(_emailController.text.isEmpty){
                    Utils.flushBarErrorMessage('Please Enter Email', context);
                  } else if(_passwordController.text.isEmpty){
                    Utils.flushBarErrorMessage('Please Enter Password', context);

                  }else if(_passwordController.text.length<6){
                    Utils.flushBarErrorMessage('Please Enter 6 Digit Password', context);
                  }else{
                    Map data={
                      'email':_emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };
                    authViewMode.loginApi(data, context);
                    print('Api Hit');
                  }

                }),
            SizedBox(height: height*.02,),
            InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.signup);
                },
                child: Text("Don't have an account? Sign Up", style: TextStyle(fontSize: 15)))



          ],
        ),
      )
    );
  }
}
