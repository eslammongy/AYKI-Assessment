import 'package:ayki_assessment/feature/home/domain/entities/shape.dart';
import 'package:ayki_assessment/feature/home/domain/usecases/fetch_shapes_data_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataState {
  final bool isLoading;
  final List<Shape>? shapes;
  final String? error;

  DataState({this.isLoading = false, this.shapes, this.error});
}

class ShapeDataNotifier extends StateNotifier<DataState> {
  final FetchShapesDataUseCase fetchShapesDataUseCase;

  ShapeDataNotifier(this.fetchShapesDataUseCase) : super(DataState()) {
    fetchShapesData();
  }

  Future<void> fetchShapesData() async {
    state = DataState(isLoading: true);
    try {
      final user = await fetchShapesDataUseCase.execute();
      state = DataState(shapes: user);
    } catch (e) {
      state = DataState(error: e.toString());
    }
  }
}

final shapeBaseProvider =
    StateNotifierProvider<ShapeDataNotifier, DataState>((ref) {
  final authenticateUserUseCase = ref.read(fetchShapeDataUCProvider);
  return ShapeDataNotifier(authenticateUserUseCase);
});
