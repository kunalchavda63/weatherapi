import 'package:flutter/material.dart';
import 'package:hii/model/weathermodel.dart';
import 'package:hii/services/service.dart';
import 'package:hii/services/weather.dart';


const TextStyle typefor = TextStyle(
    fontFamily: 'Spartan',
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.w800);

class Weatherpage extends StatefulWidget {
  const Weatherpage({super.key});

  @override
  State<Weatherpage> createState() => _WeatherpageState();
}

class _WeatherpageState extends State<Weatherpage> {
  final _weatherService = Service(apikey: 'e2634f4f6e9c7ad60d6092bb52eb6c2e');
  Weather? _weather;
  _fetchWeather() async {
    String cityname = await _weatherService.getCurrentCity();





    try {
      final weather = await _weatherService.getWeather(cityname);
      setState(() {
        _weather = weather;

      });
    } catch (e) {
      print(e);
    }
  }

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.8,
              image: AssetImage("assets/images/location_background.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.near_me,
                      color: Colors.white,
                      size: 32,
                 ),
                   Icon(
                      Icons.location_city_rounded,
                      color: Colors.white,
                      size: 32,
                    )
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${_weather!.temprature.toStringAsFixed(0)}°",
                      style: TextStyle(
                          fontSize: 50,
                          fontFamily: "Spartan",
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.all(8),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/icon/${_weather?.icon ?? "01d"}.png'))),
                      ),
                    )
                  ],
                ),
                Text(
                  _weather?.cityname ?? "Loading city...",
                  style: typefor,
                ),
                Text(
                  _weather?.condition ?? "Loading ...",
                  style: typefor,
                ),
                Text(
                  _weather?.icon ?? "01d ",style: typefor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
