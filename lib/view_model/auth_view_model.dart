import 'package:flutter/cupertino.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo=AuthRepository();
  
  bool _loading=false;
  bool get loading=>_loading;

  bool _signUpLoading=false;
  bool get signUpLoading=>_signUpLoading;
  
  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signUpLoading=value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async{

    setLoading(true);
    _myRepo.loginApi(data).then((value) => {
      
      setLoading(false),
      Navigator.pushNamed(context, RoutesName.home),

    }).onError((error, stackTrace) => {

      setLoading(false)
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async{

    setSignUpLoading(true);
    _myRepo.loginApi(data).then((value) => {

      setSignUpLoading(false),
      Navigator.pushNamed(context, RoutesName.home),

    }).onError((error, stackTrace) => {

      setSignUpLoading(false)
    });
  }

}