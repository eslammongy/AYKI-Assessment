import 'package:ayki_assessment/feature/home/data/datasource/data_source.dart';
import 'package:ayki_assessment/feature/home/data/models/shape_model.dart';
import 'package:ayki_assessment/feature/home/domain/entities/shape.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'shape_repository.dart';

class ShapeRepositoryImpl implements ShapeRepository {
  final ShapesDataSource dataSource;
  const ShapeRepositoryImpl({required this.dataSource});

  @override
  Future<List<Shape>> fetchShapeData() async {
    try {
      final jsonResult = await dataSource.fetchDataFromFile();
      final shapes =
          jsonResult.map((shape) => ShapeModel.fromMap(shape)).toList();
      return shapes;
    } catch (exception) {
      rethrow;
    }
  }
}

final shapesRepositoryProvider = Provider<ShapeRepositoryImpl>((ref) {
  final dataSource = ref.read(dataSourceProvider);
  return ShapeRepositoryImpl(dataSource: dataSource);
});
