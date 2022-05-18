import 'package:flutter/material.dart';
import 'package:wheater/data_service.dart';
import 'package:wheater/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController controller = TextEditingController();
  DataService dataService = DataService();
  weather wearther = weather();
  bool isFetch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Cuaca App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isFetch
                ? Column(
                    children: [
                      Image.network(
                          'http://openweathermap.org/img/wn/${wearther.icon}@2x.png'),
                      Text(
                        '${wearther.temp}°',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        wearther.description,
                        style: Theme.of(context).textTheme.headline4,
                      )
                    ],
                  )
                : SizedBox(),
            Container(
              width: 150,
              padding: EdgeInsets.symmetric(vertical: 50),
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(labelText: 'City'),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  isFetch = true;
                  wearther = await dataService.fetchData(controller.text);
                  setState(() {});
                },
                child: Text('Search'))
          ],
        ),
      ),
    );
  }
}
