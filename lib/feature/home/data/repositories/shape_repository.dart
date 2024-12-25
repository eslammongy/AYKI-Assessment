import 'package:ayki_assessment/feature/home/domain/entities/shape.dart';

abstract class ShapeRepository {
  /// Fetches all shapes data from the JSON file and returns a list of shapes entities.
  Future<List<Shape>> fetchShapeData();
}
