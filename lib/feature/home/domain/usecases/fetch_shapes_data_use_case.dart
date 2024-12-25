import 'package:ayki_assessment/feature/home/data/repositories/shape_repository.dart';
import 'package:ayki_assessment/feature/home/data/repositories/shape_repository_impl.dart';
import 'package:ayki_assessment/feature/home/domain/entities/shape.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FetchShapesDataUseCase {
  final ShapeRepository shapeRepository;

  FetchShapesDataUseCase(this.shapeRepository);

  Future<List<Shape>> execute() {
    return shapeRepository.fetchShapeData();
  }
}

final fetchShapeDataUCProvider = Provider<FetchShapesDataUseCase>((ref) {
  final shapesRepository = ref.read(shapesRepositoryProvider);
  return FetchShapesDataUseCase(shapesRepository);
});
