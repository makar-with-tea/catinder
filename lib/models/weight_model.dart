class WeightModel {
  final String? imperial;
  final String? metric;

  WeightModel({this.imperial, this.metric});

  factory WeightModel.fromJson(Map<String, dynamic> json) {
    return WeightModel(imperial: json['imperial'], metric: json['metric']);
  }
}
