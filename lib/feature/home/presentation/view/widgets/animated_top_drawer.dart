import 'package:ayki_assessment/core/theme/app_theme.dart';
import 'package:ayki_assessment/core/utils/helper.dart';
import 'package:ayki_assessment/core/utils/size_config.dart';
import 'package:ayki_assessment/feature/home/domain/entities/shape.dart';
import 'package:flutter/material.dart';
import 'shapes_listview.dart';

class AnimatedTopDrawer extends StatefulWidget {
  const AnimatedTopDrawer({super.key, required this.shapes});
  final List<Shape> shapes;

  @override
  State<AnimatedTopDrawer> createState() => AnimatedTopDrawerState();
}

class AnimatedTopDrawerState extends State<AnimatedTopDrawer> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
     final height = sizeConfig.height * 0.25;
    return AnimatedPositioned(
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      top: isVisible ? 0 : -height,
      right: 0,
      left: 0,
      height: height,
      child: DecoratedBox(
        decoration: topDecoration(context),
        child: Column(
          spacing: 16,
          children: [
            Expanded(
              child: ShapesListview(shapes: widget.shapes),
            ),
            Icon(
              Icons.keyboard_double_arrow_down_rounded,
              size: 34,
              color: context.colorScheme.onPrimaryContainer,
            ),
          ],
        ),
      ),
    );
  }

  animateDrawer({bool visible = true}) {
    setState(() => isVisible = visible);
  }
}
