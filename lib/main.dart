import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_report/pages/weather.dart';
import 'controllers/weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => WeatherController())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _city;
  var _scaffoldkey = GlobalKey<ScaffoldState>();
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("Weather Forecast"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3),
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter the City Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  keyboardType: TextInputType.multiline,
                  initialValue: _city?.isEmpty ?? true ? "" : _city,
                  validator: (String value) {
                    return value.isEmpty ? 'Please enter the City' : null;
                  },
                  onChanged: (String value) {
                    _city = value;
                  },
                  onSaved: (String value) {
                    _city = value;
                    print(_city);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                      child: Material(
                    color: Colors.blue,
                    child: MaterialButton(
                      height: 50,
                      color: Colors.blue,
                      child: new Text('SUBMIT',
                          style: new TextStyle(
                              fontSize: 16.0, color: Colors.white)),
                      onPressed: () async {
                        if (!_formkey.currentState.validate()) {
                          return;
                        } else {
                          print(_city);
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => Weather(_city)),
                          );
                        }
                      },
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
