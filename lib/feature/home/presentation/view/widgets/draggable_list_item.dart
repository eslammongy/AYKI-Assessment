import 'package:ayki_assessment/core/theme/text_style_manager.dart';
import 'package:ayki_assessment/feature/home/domain/entities/shape.dart';
import 'package:flutter/material.dart';
import 'shape_icon.dart';

class DraggableListItem extends StatelessWidget {
  const DraggableListItem({super.key, required this.shape});
  final Shape shape;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: LongPressDraggable<Shape>(
        data: shape,
        dragAnchorStrategy: pointerDragAnchorStrategy,
        feedback: FractionalTranslation(
          translation: const Offset(-0.5, -0.5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 60,
              width: 60,
              child: Opacity(
                opacity: 0.8,
                child: buildShapeIcon(context, shape.type),
              ),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            buildShapeIcon(context, shape.type),
            Text(
              shape.type ?? "",
              maxLines: 1,
              style: TextStyleManager.smallBody,
            ),
          ],
        ),
      ),
    );
  }
}
