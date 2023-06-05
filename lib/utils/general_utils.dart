import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  static toastMessage (String message){
    Fluttertoast.showToast(msg: message,
    backgroundColor: Colors.amber,
    textColor: Colors.white,
    fontSize: 15,
    toastLength: Toast.LENGTH_LONG);

  }

  static void flushBarErrorMessage(String message, BuildContext context){
    showFlushbar(context: context,
        flushbar: Flushbar(
          message: message,
          backgroundColor: Colors.red,
          title: 'SAD',
          messageColor: Colors.white,
          duration: Duration(seconds: 5),
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(15),
          titleColor: Colors.white,
          borderRadius: BorderRadius.circular(10),
          reverseAnimationCurve: Curves.easeOut,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          icon: Icon(Icons.error, size: 20, color: Colors.white,),

        )..show(context));
  }

  static snakBar(String message, BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.green,
          content: Text(message))
    );
  }

  static void fieldFocusChange(
      BuildContext context,
      FocusNode currentFocus,
      FocusNode nextFocus){
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }


}