import 'dart:convert';
import 'package:http/http.dart ' as http;

class covidrequest {
  String url = 'https://disease.sh/v3/covid-19/countries';
  int infected = 0;
  int cured = 0;
  int death = 0;
  int country = 94;
  covidrequest({required this.country});
  dynamic body;
  Future<void> fetch_details() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      body = response.body; //96
      var data = jsonDecode(body);
      death = data[country]['deaths'];
      cured = data[country]['recovered'];
      infected = data[country]['cases'];
    }
  }

  var update_value = 0;
  var today_cases = 0;
  var today_death = 0;
  var today_recovered = 0;
  var affectted_countries = 0;

  Future<void> fetch_cout() async {
    http.Response response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));

    if (response.statusCode == 200) {
      dynamic body = response.body;
      var data = jsonDecode(body);
      update_value = data['updated'];
      today_cases = data['todayCases'];
      today_death = data['todayDeaths'];
      today_recovered = data['todayRecovered'];
      affectted_countries = data['affectedCountries'];
      print('this is server');
      print(update_value);
    } else {
      print('ERROR');
    }
  }
}
