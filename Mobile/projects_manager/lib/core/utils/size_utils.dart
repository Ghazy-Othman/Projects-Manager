//
//
//
import "package:flutter/material.dart";

// This functions are responsible to make UI responsive across all the mobile devices.

MediaQueryData mediaQueryData = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.single);

// These are the Viewport values of your Figma Design.
// These are used in the code as a reference to create your UI Responsively.
const num figmaDesignWidth = 411;
const num figmaDesignHeight = 823;
const num figmaDesignStatusBar = 44;

///This method is used to get device viewport width.
double get _width {
  return mediaQueryData.size.width;
}

///This method is used to get device viewport height.
num get _height {
  final num statusBar = mediaQueryData.viewPadding.top;
  final num bottomBar = mediaQueryData.viewPadding.bottom;
  final num screenHeight = mediaQueryData.size.height - statusBar - bottomBar;
  return screenHeight;
}

///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
double getHorizontalSize(double px) {
  return ((px * _width) / figmaDesignWidth);
}

///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
double getVerticalSize(double px) {
  return ((px * _height) / (figmaDesignHeight - figmaDesignStatusBar));
}

///This method is used to set smallest px in image height and width
double getSize(double px) {
  final height = getVerticalSize(px);
  final width = getHorizontalSize(px);
  if (height < width) {
    return height.toDoubleValue();
  } else {
    return width.toDoubleValue();
  }
}

///This method is used to set text font size according to Viewport
double getFontSize(double px) {
  return getSize(px);
}

///This method is used to set padding responsively
EdgeInsets getPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

///This method is used to set margin responsively
EdgeInsets getMargin({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

///This method is used to get padding or margin responsively
EdgeInsets getMarginOrPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  if (all != null) {
    left = all;
    top = all;
    right = all;
    bottom = all;
  }
  return EdgeInsets.only(
    left: getHorizontalSize(
      left ?? 0,
    ),
    top: getVerticalSize(
      top ?? 0,
    ),
    right: getHorizontalSize(
      right ?? 0,
    ),
    bottom: getVerticalSize(
      bottom ?? 0,
    ),
  );
}

extension FormatExtension on double {
  /// Return a [double] value with formatted according to provided fractionDigits
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }
}
