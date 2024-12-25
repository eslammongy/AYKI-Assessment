import 'package:ayki_assessment/core/utils/size_config.dart';
import 'package:ayki_assessment/feature/home/presentation/view/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  /// This adaptive layout determines the app's home screen.
  /// Currently, we use the same UI for mobile, tablet, and desktop layouts
  /// as the UI design is not complex and not require different handling
  /// for different screen sizes.
  const AdaptiveLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return LayoutBuilder(
      builder: (
        context,
        constrains,
      ) {
        final maxWidth = constrains.maxWidth;
        // This just for simulating how the responsive layout work when we have different UI for different screen sizes
        if (maxWidth < sizeConfig.tabletBreakpoint) {
          return HomeScreen();
        } else if (maxWidth < sizeConfig.desktopBreakpoint) {
          return HomeScreen();
        } else {
          return HomeScreen();
        }
      },
    );
  }
}
