import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_report/controllers/weather.dart';
import 'package:weather_report/utility/appstate.dart';

import '../main.dart';

class Weather extends StatefulWidget {
  Weather(this.city);
  String city;
  var currDt = DateTime.now();

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  var _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      Provider.of<WeatherController>(context, listen: false)
          .getWeather(widget.city);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.purple,
          key: _scaffoldkey,
          body: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20)),
            child: Consumer<WeatherController>(builder: (context, data, child) {
              return data.state == AppState.Busy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Text(
                          "${getDay(DateTime.now().weekday)},${DateTime.now().day} ${getMonth(DateTime.now().month)}",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Text(
                          data.weatherModel.current.observationTime?.isEmpty ??
                                  true
                              ? ""
                              : data.weatherModel.current.observationTime,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Text(
                          data.weatherModel.location.name?.isEmpty ?? true
                              ? ""
                              : data.weatherModel.location.name,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Image.network(
                            "https://assets.weatherstack.com/images/wsymbols01_png_64/wsymbol_0024_thunderstorms.png"),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Text(
                          data.weatherModel.current.temperature.toString() +
                              " c",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Text(
                          getDay(DateTime.now().weekday),
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  "Mon",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.cloud,
                                  color: Colors.white,
                                ),
                                Text(data.weatherModel.current.temperature
                                    .toString())
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "Tue",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.cloud,
                                  color: Colors.white,
                                ),
                                Text(data.weatherModel.current.temperature
                                    .toString())
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "Wed",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.cloud,
                                  color: Colors.white,
                                ),
                                Text(data.weatherModel.current.temperature
                                    .toString())
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "Thu",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.cloud,
                                  color: Colors.white,
                                ),
                                Text(data.weatherModel.current.temperature
                                    .toString())
                              ],
                            )
                          ],
                        ),
                        Center(
                          child: FlatButton(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              "Search Another",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                              );
                            },
                          ),
                        )
                      ],
                    );
            }),
          ),
        )
      ],
    );
  }

  String getDay(int day) {
    String today = "";
    switch (day) {
      case 1:
        today = "Monday";
        break;
      case 2:
        today = "Tuesday";
        break;
      case 3:
        today = "Wednesday";
        break;
      case 4:
        today = "Thrusday";
        break;
      case 5:
        today = "Friday";
        break;
      case 6:
        today = "Saturday";
        break;
      case 7:
        today = "Sunday";
        break;

      default:
    }
    return today;
  }

  String getMonth(int month) {
    String today = "";
    switch (month) {
      case 1:
        today = "January";
        break;
      case 2:
        today = "February";
        break;
      case 3:
        today = "March";
        break;
      case 4:
        today = "April";
        break;
      case 5:
        today = "May";
        break;
      case 6:
        today = "June";
        break;
      case 7:
        today = "July";
        break;
      case 8:
        today = "August";
        break;
      case 9:
        today = "September";
        break;
      case 10:
        today = "October";
        break;
      case 11:
        today = "November";
        break;
      case 12:
        today = "December";
        break;

      default:
    }
    return today;
  }
}
