import 'package:equatable/equatable.dart';

class Weight extends Equatable {
  final String? imperial;
  final String? metric;

  const Weight({
    this.imperial,
    this.metric,
  });

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      imperial: json['imperial'] ?? '',
      metric: json['metric'] ?? '',
    );
  }

  @override
  List<Object?> get props => [imperial, metric];
}
