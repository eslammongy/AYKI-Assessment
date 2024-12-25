import 'package:ayki_assessment/core/theme/app_theme.dart';
import 'package:ayki_assessment/feature/home/presentation/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeNotifierProvider.notifier);
    final themeMode = ref.watch(themeNotifierProvider);
    return AppBar(
      backgroundColor: context.colorScheme.primaryContainer,
      title: Text('AYKI'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            themeMode == ThemeMode.light
                ? Icons.brightness_7_rounded
                : Icons.light_mode_rounded,
          ),
          onPressed: () {
            themeNotifier.toggleTheme();
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
