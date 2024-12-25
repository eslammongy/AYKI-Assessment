import 'package:ayki_assessment/core/theme/app_theme.dart';
import 'package:ayki_assessment/core/theme/text_style_manager.dart';
import 'package:flutter/material.dart';

/// This method is used to display a loading widget
Center displayLoadingWidget(
  BuildContext context, {
  String loadingMsg = "please waiting...",
}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator.adaptive(),
        const SizedBox(
          height: 10,
        ),
        Text(
          loadingMsg,
          textAlign: TextAlign.center,
          style: TextStyleManager.largeBody,
        ),
      ],
    ),
  );
}

BoxDecoration bottomDecoration(BuildContext context) {
  return BoxDecoration(
    color: context.colorScheme.primaryContainer,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20), topRight: Radius.circular(20)),
  );
}

BoxDecoration topDecoration(BuildContext context) {
  return BoxDecoration(
    color: context.colorScheme.primaryContainer,
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
  );
}

displaySnackbar(BuildContext context,
    {String? msg = "msg", bool isError = false}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg ?? "",
        style: TextStyleManager.largeBody.copyWith(color: Colors.white),
      ),
      backgroundColor:
          isError ? context.colorScheme.error : context.colorScheme.primary,
      duration: const Duration(seconds: 1),
    ),
  );
}

/// This method is used to get the shape icon
getShapeIcon({required String type}) => shapeMapIcons[type];

final shapeMapIcons = {
  "Circle": Icons.circle,
  "Rectangle": Icons.rectangle_outlined,
  "Triangle": Icons.change_history_rounded,
  "Square": Icons.crop_square_rounded,
  "Hexagon": Icons.hexagon_outlined,
  "Pentagon": Icons.pentagon_outlined,
  "Star": Icons.star_border_outlined,
};

/// This function used to apply rounded border style for buttons
btnRoundedBorderStyle(Color color) {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: color, width: 2),
    ),
  );
}
