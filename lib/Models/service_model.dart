class ServiceModel {
  final String cityName;
  final DateTime date;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String image;
  final String condition;

  ServiceModel({
    required this.cityName,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.image,
    required this.condition,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
