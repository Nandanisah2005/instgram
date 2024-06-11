import 'package:http/http.dart' as http;
class ApiService{
  currentdata(){
    string key = '';
    var respose = http.get(Uri.parse(" http://api.weatherapi.com/v1/current.json"),);
  }
}