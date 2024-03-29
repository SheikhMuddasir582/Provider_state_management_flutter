

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {

  bool _loading= false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading= value;
    notifyListeners();
  }


  void login(String email, String passwword) async{

    setLoading(true);
    try{
      Response response= await post(Uri.parse('https://reqres.in/api/login'),
          body: {
            'email' : email,
            'password' :     passwword,
          }
      );
      if(response.statusCode == 200){
        print('successfull');
        setLoading(false);
      }
      else{
        setLoading(false);
        print('failed');

      }
    }
    catch(e){
      setLoading(false);
      print(e.toString());
    }

  }


}

