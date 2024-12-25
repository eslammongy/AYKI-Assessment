import 'package:ayki_assessment/feature/home/domain/entities/shape.dart';
import 'package:ayki_assessment/feature/home/presentation/view/widgets/shape_icon.dart';
import 'package:flutter/material.dart';

import 'draggable_list_item.dart';

class ShapesListview extends StatelessWidget {
  const ShapesListview(
      {super.key, this.isTarget = false, required this.shapes});
  final List<Shape> shapes;
  final bool isTarget;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: shapes.length,
      itemExtent: 80,
      padding: EdgeInsets.only(right: 12),
      itemBuilder: (context, index) {
        if (isTarget) {
          return Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: buildShapeIcon(
              context,
              shapes[index].type,
            ),
          );
        } else {
          return DraggableListItem(
            shape: shapes[index],
          );
        }
      },
    );
  }
}
