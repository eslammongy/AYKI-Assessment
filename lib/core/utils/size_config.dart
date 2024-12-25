import 'package:flutter/material.dart';

class SizeConfig {
  final double desktopBreakpoint = 1200;
  final double tabletBreakpoint = 800;
  final double mobileBreakpoint = 375;

  static final SizeConfig _instance = SizeConfig._internal();

  factory SizeConfig() {
    return _instance;
  }

  SizeConfig._internal();

  double _width = 0;
  double _height = 0;

  double get width => _width;
  double get height => _height;

  void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    _width = mediaQuery.size.width;
    _height = mediaQuery.size.height;
  }

  bool get isMobile => _width < tabletBreakpoint;
  bool get isTablet => _width >= tabletBreakpoint && _width < desktopBreakpoint;
  bool get isDesktop => _width >= desktopBreakpoint;

  /// Scale text size based on the screen size
  double scaleText(double baseSize) {
    if (isDesktop) return baseSize * 1.2;
    if (isTablet) return baseSize * 1.1;
    return baseSize;
  }
}

SizeConfig get sizeConfig => SizeConfig();
