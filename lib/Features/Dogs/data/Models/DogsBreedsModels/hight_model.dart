import 'package:equatable/equatable.dart';

class Height extends Equatable {
  final String imperial;
  final String metric;

  const Height({
    required this.imperial,
    required this.metric,
  });

  @override
  List<Object?> get props => [imperial, metric];

  factory Height.fromJson(Map<String, dynamic> json) {
    return Height(
      imperial: json['imperial'] as String,
      metric: json['metric'] as String,
    );
  }
}
