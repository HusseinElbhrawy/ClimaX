import 'package:equatable/equatable.dart';

class WeatherSecondaryInfoModel extends Equatable {
  final String imagePath;
  final String title;
  final String value;

  const WeatherSecondaryInfoModel({
    required this.imagePath,
    required this.title,
    required this.value,
  });

  @override
  List<Object> get props => [imagePath, title, value];
}
