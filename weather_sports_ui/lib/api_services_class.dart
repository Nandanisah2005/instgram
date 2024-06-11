import 'dart:convert';

import 'package:weather_sports_ui/sports_model_screen.dart';
import 'package:http/http.dart' as http;
class SportsWeatherApi{
  Future<SportsModel>getData(String Country)async{
    var apiKey = '29139d34d1344378943104217241006';
    var url = Uri.parse("http://api.weatherapi.com/v1/sports.json?Key=$apiKey&q=$Country");
    var response = await http.get(url);
    if(response.statusCode == 200){
      var decode = jsonDecode(response.body);
      var data = SportsModel.fromJson(decode);
      return data;
    }
    else{
      return SportsModel();
    }
  }
}