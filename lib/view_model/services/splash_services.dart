
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/user_view-model.dart';

import '../../model/user_model.dart';

class Splashservices{
  Future<UserModal> getUserData()=> UserViewModel().getUser();
  void checkAuthentication(BuildContext context) async{
    getUserData().then((value) async {

      if(value.token==null || value.token==''){
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      }else{
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
      
    }).onError((error, stackTrace) {
      if(kDebugMode){
        print(error.toString());
      }
    });

    
  }
  
  

}