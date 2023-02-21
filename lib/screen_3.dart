import 'casecard.dart';
import 'package:flutter/material.dart';
import 'tittlecard.dart';
import 'covid_request.dart';

int route_affected = 0;
int route_death = 0;
int route_recovered = 0;
int route_updated = 0;
int route_case = 0;

dynamic route_function() async {
  covidrequest response = covidrequest(country: 94);
  await response.fetch_cout();
  route_affected = response.affectted_countries;
  route_death = response.today_death;
  route_case = response.today_cases;
  route_recovered = response.today_recovered;
  route_updated = response.update_value;
}

class live_status extends StatefulWidget {
  @override
  State<live_status> createState() => _live_statusState();
}

class _live_statusState extends State<live_status> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await route_function();
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            titlecard(
                uppertext: 'Covid-19',
                lowertext: 'Live Count',
                picture: 'assests/virus.png'),
            casecard(count: route_affected, str: 'Affected Countries'),
            casecard(count: route_updated, str: 'Updated Count'),
            casecard(count: route_case, str: 'Today Cases'),
            casecard(count: route_recovered, str: 'Today Recovered'),
            casecard(count: route_death, str: 'Today Death'),
          ],
        ),
      ),
    );
  }
}
