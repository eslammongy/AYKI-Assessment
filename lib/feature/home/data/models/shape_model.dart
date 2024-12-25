import 'package:ayki_assessment/feature/home/domain/entities/shape.dart';

class ShapeModel extends Shape {
  const ShapeModel({super.id, super.type, super.desc});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'desc': desc,
    };
  }

  factory ShapeModel.fromMap(Map<String, dynamic> map) {
    return ShapeModel(
      id: map['id'] != null ? map['id'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
    );
  }
}
