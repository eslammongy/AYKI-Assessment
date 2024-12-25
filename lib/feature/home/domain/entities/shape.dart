import 'package:equatable/equatable.dart';

class Shape extends Equatable {
  final String? id;
  final String? type;
  final String? desc;

  const Shape({
    this.id,
    this.type,
    this.desc,
  });

  @override
  List<Object?> get props => [id, type, desc];
}
