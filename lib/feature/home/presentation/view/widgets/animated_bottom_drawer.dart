import 'package:ayki_assessment/core/theme/app_theme.dart';
import 'package:ayki_assessment/core/theme/text_style_manager.dart';
import 'package:ayki_assessment/core/utils/helper.dart';
import 'package:ayki_assessment/core/utils/size_config.dart';
import 'package:ayki_assessment/feature/home/domain/entities/shape.dart';
import 'package:flutter/material.dart';
import 'shapes_listview.dart';

class AnimatedBottomDrawer extends StatefulWidget {
  const AnimatedBottomDrawer({super.key});

  @override
  State<AnimatedBottomDrawer> createState() => AnimatedBottomDrawerState();
}

class AnimatedBottomDrawerState extends State<AnimatedBottomDrawer> {
  bool _isVisible = false;
  final List<Shape> _shapes = [];

  @override
  Widget build(BuildContext context) {
    final height = sizeConfig.height * 0.25;
    return AnimatedPositioned(
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      bottom: _isVisible ? 0 : -height,
      height: height,
      left: 0,
      right: 0,
      child: DecoratedBox(
          decoration: bottomDecoration(context),
          child: _buildDragTarget(
            context,
            child: Column(
              spacing: 10,
              children: [
                Icon(
                  Icons.keyboard_double_arrow_up_rounded,
                  size: 34,
                  color: context.colorScheme.onPrimaryContainer,
                ),
                Center(
                  child: Text(
                    'Drop here...',
                    style: TextStyleManager.largeBody.copyWith(
                        color: context.colorScheme.onPrimaryContainer),
                  ),
                ),
                if (_shapes.isNotEmpty) ...[
                  SizedBox(
                    height: 60,
                    child: ShapesListview(
                      shapes: _shapes,
                      isTarget: true,
                    ),
                  )
                ]
              ],
            ),
          )),
    );
  }

  DragTarget<Shape> _buildDragTarget(BuildContext context,
      {required Widget child}) {
    return DragTarget<Shape>(
      builder: (context, candidateItems, rejectedItems) {
        return child;
      },
      onAcceptWithDetails: (details) {
        setState(() => _shapes.add(details.data));
      },
    );
  }

  animateBottomDrawer({bool visible = true}) {
    setState(() => _isVisible = visible);
  }
}
