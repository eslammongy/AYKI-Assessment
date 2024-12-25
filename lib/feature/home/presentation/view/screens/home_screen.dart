import 'package:ayki_assessment/core/theme/app_theme.dart';
import 'package:ayki_assessment/core/theme/text_style_manager.dart';
import 'package:ayki_assessment/core/utils/helper.dart';
import 'package:ayki_assessment/feature/home/presentation/providers/shapes_provider.dart';
import 'package:ayki_assessment/feature/home/presentation/view/widgets/animated_bottom_drawer.dart';
import 'package:ayki_assessment/feature/home/presentation/view/widgets/animated_top_drawer.dart';
import 'package:ayki_assessment/feature/home/presentation/view/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

GlobalKey<AnimatedTopDrawerState> topDrawerKey = GlobalKey();
GlobalKey<AnimatedBottomDrawerState> bottomDrawerKey = GlobalKey();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Consumer(builder: (context, ref, child) {
        final shapeProvider = ref.watch(shapeBaseProvider);
        _listener(context, ref);
        return Stack(
          children: [
            if (shapeProvider.isLoading) ...[
              Center(child: CircularProgressIndicator()),
            ],
            if (shapeProvider.shapes != null) ...[
              _screenClickableArea(context),
              AnimatedTopDrawer(
                key: topDrawerKey,
                shapes: shapeProvider.shapes!,
              ),
              AnimatedBottomDrawer(
                key: bottomDrawerKey,
              ),
            ]
          ],
        );
      }),
    );
  }

  Theme _screenClickableArea(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: InkWell(
        radius: 0,
        onTap: () {
          _updateDrawerState(visible: false);
        },
        child: SizedBox.expand(
          child: _buildOpenDrawersBtn(context),
        ),
      ),
    );
  }

  void _listener(BuildContext context, WidgetRef ref) {
    ref.listen(shapeBaseProvider.select((value) => value), (_, state) {
      if (state.error != null) {
        displaySnackbar(context, msg: state.error, isError: true);
      }
      if (state.shapes != null) {
        displaySnackbar(context, msg: "Data loaded successfully..");
      }
    });
  }

  Center _buildOpenDrawersBtn(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: btnRoundedBorderStyle(context.colorScheme.onPrimaryContainer),
        onPressed: () {
          _updateDrawerState();
        },
        child: Text(
          'Open Drawers',
          style: TextStyleManager.buttons,
        ),
      ),
    );
  }

  /// This method is used to update the state of the drawers boxes and used to animate the drawer by the widgets keys
  void _updateDrawerState({bool visible = true}) {
    final currentState = topDrawerKey.currentState?.isVisible;
    // avoid unnecessary rebuilds
    if (currentState == visible) return;
    topDrawerKey.currentState?.animateDrawer(visible: visible);
    bottomDrawerKey.currentState?.animateBottomDrawer(visible: visible);
  }
}
