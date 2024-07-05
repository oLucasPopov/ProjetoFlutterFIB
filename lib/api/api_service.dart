import 'package:http/http.dart' as http;

class ApiService {
  buscarHerois() async {
    var response =
        await http.get(Uri.parse("http://demo1201562.mockable.io/herois"));
    if (response.statusCode == 200) {
      print(response.body);
    }
  }
}
