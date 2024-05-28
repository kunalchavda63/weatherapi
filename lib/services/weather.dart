import '../model/weathermodel.dart';
import 'package:hii/services/service.dart';

class condition {
  late Weather _weather;
  final service = Service(apikey: 'e2634f4f6e9c7ad60d6092bb52eb6c2e');

var icon;
  Future<String> geticon() async {
     icon = _weather.icon;
    return icon;
  }

  Future<String> messege(icon) async {
    if (icon == '01d') {
      return "☀️";
    }
    else if(icon == '02d'){
      return "🌤️";
    }
    else if(icon == '03d'){
      return "☁️";
    }
    else if(icon == '04d'){
      return "☁️";
    }
    else if(icon == '09d'){
      return "🌧️";
    }
    else if(icon == '10d'){
      return "🌧️";
    }
    else if(icon == '11d'){
      return "⛈️";
    }
    else if(icon == '13d'){
      return "❄️";
    }
    else if(icon == '50d'){
      return "🌫️";
    }
    else if(icon == '01n'){
      return "🌙";
    }
    else if(icon == '02n'){
      return "🌙🌤️";
    }
    else if(icon == '03n'){
      return "🌙☁️";
    }
    else if(icon == '04n'){
      return "🌙☁️";
    }
    else if(icon == '09n'){
      return "🌙🌧️";
    }
    else if(icon == '10n'){
      return "🌙🌧️";
    }
    else if(icon == '11n'){
      return "🌙⛈️";
    }
    else if(icon == '13n'){
      return "🌙❄️";
    }
    else if(icon == '50n'){
      return "🌙🌫️";
    }
    else{
      return "☀️";
    }
    }
}