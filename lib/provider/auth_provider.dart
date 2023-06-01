import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier{

  bool _loading=false;
  bool get loading=>_loading;

  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }

 void login(String email, String passsword) async{

    setLoading(true);

   try{
     Response response=await post(Uri.parse('https://reqres.in/api/login'),
     body: {
       'email': email,
       'password': passsword,
     }
     );

     if (response.statusCode==200){
       print('Successful!');
       setLoading(false);
     }
     else{
       print('Try Correctly');
     }
   }
   catch(e){
      setLoading(false);
      print(e.toString());
   }
 }
}