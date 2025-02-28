import 'dart:convert';

import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final List<Weather> weather;
  final Main main;
  final Wind wind;
  final int? timezone;
  final String? name;
  final String? dtTxt;

  const WeatherModel({
    required this.weather,
    required this.main,
    required this.wind,
    this.timezone,
    this.name,
    this.dtTxt,
  });

  @override
  List<Object?> get props {
    return [
      weather,
      main,
      wind,
      timezone,
      name,
      dtTxt,
    ];
  }

  WeatherModel copyWith({
    List<Weather>? weather,
    Main? main,
    Wind? wind,
    int? timezone,
    String? name,
    String? dtTxt,
  }) {
    return WeatherModel(
      weather: weather ?? this.weather,
      main: main ?? this.main,
      wind: wind ?? this.wind,
      timezone: timezone ?? this.timezone,
      name: name ?? this.name,
      dtTxt: dtTxt ?? this.dtTxt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weather': weather.map((x) => x.toMap()).toList(),
      'main': main.toMap(),
      'wind': wind.toMap(),
      'timezone': timezone,
      'name': name,
      'dt_txt': dtTxt,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      weather: List<Weather>.from(
        (map['weather'] as List<dynamic>).map<Weather>(
          (x) => Weather.fromMap(x as Map<String, dynamic>),
        ),
      ),
      main: Main.fromMap(map['main'] as Map<String, dynamic>),
      wind: Wind.fromMap(map['wind'] as Map<String, dynamic>),
      timezone: map['timezone'] as int?,
      name: map['name'] as String?,
      dtTxt: map['dt_txt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

class Weather extends Equatable {
  final String main;
  final String description;
  const Weather({
    required this.main,
    required this.description,
  });

  @override
  List<Object> get props => [main, description];

  Weather copyWith({
    String? main,
    String? description,
  }) {
    return Weather(
      main: main ?? this.main,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'main': main,
      'description': description,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      main: map['main'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

class Main extends Equatable {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;
  final int grandLevel;

  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grandLevel,
  });

  @override
  List<Object> get props {
    return [
      temp,
      feelsLike,
      tempMin,
      tempMax,
      pressure,
      humidity,
      seaLevel,
      grandLevel,
    ];
  }

  Main copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
    int? seaLevel,
    int? grandLevel,
  }) {
    return Main(
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      seaLevel: seaLevel ?? this.seaLevel,
      grandLevel: grandLevel ?? this.grandLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      'sea_level': seaLevel,
      'grnd_level': grandLevel,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'] as double,
      feelsLike: map['feels_like'] as double,
      tempMin: map['temp_min'] as double,
      tempMax: map['temp_max'] as double,
      pressure: map['pressure'] as int,
      humidity: map['humidity'] as int,
      seaLevel: map['sea_level'] as int,
      grandLevel: map['grnd_level'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) =>
      Main.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

class Wind extends Equatable {
  final double speed;

  const Wind({
    required this.speed,
  });

  @override
  List<Object> get props => [speed];

  Wind copyWith({
    double? speed,
  }) {
    return Wind(
      speed: speed ?? this.speed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'speed': speed,
    };
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) =>
      Wind.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
