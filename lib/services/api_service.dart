import 'dart:convert';

import 'package:codigo2_alerta/models/user_model.dart';
import 'package:codigo2_alerta/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<UserModel?> login(String dni, String password) async {
    Uri _url = Uri.parse("$pathProduction/login/");
    http.Response response = await http.post(
      _url,
      headers: {
        "content-Type": "application/json",
      },
      body: json.encode(
        {
          "username": dni,
          "password": password,
        },
      ),
    );
    if(response.statusCode == 200){
      Map<String,dynamic> myMapp = json.decode(response.body);
      UserModel userModel = UserModel.fromJson(myMapp["user"]);
      return userModel;
    }
    return null;
  }
}
