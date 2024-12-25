import 'package:ayki_assessment/core/theme/app_theme.dart';
import 'package:ayki_assessment/core/utils/helper.dart';
import 'package:flutter/material.dart';

/// This method is used to display the shape icon widget
Widget buildShapeIcon(BuildContext context, String? type) {
  return Card(
    color: context.colorScheme.primary,
    margin: EdgeInsets.zero,
    child: SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.center,
          child: Icon(
            getShapeIcon(type: type??"Star"),
            size: 34,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
