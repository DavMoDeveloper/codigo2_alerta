import 'dart:convert';

import 'package:codigo2_alerta/models/citizen_model.dart';
import 'package:codigo2_alerta/models/incident_type_model.dart';
import 'package:codigo2_alerta/models/user_model.dart';
import 'package:codigo2_alerta/ui/pages/incident_type_page.dart';
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

  Future<List<CitizenModel>> getCitizen() async{
    Uri _url = Uri.parse("$pathProduction/ciudadanos/");
    http.Response response = await http.get(_url);
    if(response.statusCode == 200){
      Map<String, dynamic> myMap = json.decode(response.body);
      List list = myMap["data"];
      List<CitizenModel> citizenList = list.map((e) => CitizenModel.fromJson(e)).toList();
      return citizenList;
    }
    return [];
  }

  Future<List<IncidentTypeModel>> getIncidentType() async{
    Uri _url = Uri.parse("$pathProduction/incidentes/tipos/");
    http.Response response = await http.get(_url);
    if(response.statusCode == 200){
      List list = json.decode(response.body);
      List<IncidentTypeModel> incidentTypeList = list.map((e) => IncidentTypeModel.fromJson(e)).toList();
      return incidentTypeList;
    }
    return [];
  }
}
