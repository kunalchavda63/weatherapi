import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../model/weathermodel.dart';
class Service{
    Service({required this.apikey});
    static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
    final String apikey;
  Future<Weather> getWeather(String cityname) async{
  final response = await http.get(Uri.parse('$BASE_URL?q=$cityname&appid=$apikey&units=metric'));
  if(response.statusCode==200){
    return Weather.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception('failed to load data');
  }
  }

  Future<String> getCurrentCity()async{
    double lat;
    double lon;
    LocationPermission permission = await Geolocator.checkPermission();
    // get permission by user
    if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
      permission = await Geolocator.requestPermission();
    }
//  fetch the current location
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    lon = position.longitude;
    //convert the place
    List<Placemark> placemark = await placemarkFromCoordinates(lat,lon);
  String?place = placemark[0].locality;

return  place ?? "";
  }

  }




