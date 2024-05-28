import 'dart:ffi';

class Weather {
  final String cityname;
  final String condition;
  final double temprature;
  final String icon;

  Weather(
      {required this.cityname,
      required this.condition,
      required this.temprature,
      required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityname: json['name'],
      condition: json['weather'][0]['main'],
      temprature: json['main']['temp'],
      icon: json['weather'][0]['icon']
    );

    }
  }


