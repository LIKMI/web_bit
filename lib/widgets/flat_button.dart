import 'package:flutter/material.dart';
import 'package:web_bit/utils/custom_colors.dart';

class CustomFlatButton extends StatelessWidget {
  CustomFlatButton(
      {this.onPressed,
      this.childWidget,
      this.textStyle,
      this.color = MAIN_RED,
      this.accentColor = MAIN_RED_ACCENT});
  final Function()? onPressed;
  final Widget? childWidget;
  final TextStyle? textStyle;
  final Color color;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: color,
      splashColor: accentColor,
      textStyle: textStyle,
      child: childWidget is Widget ? childWidget : SizedBox.shrink(),
      onPressed: onPressed,
    );
  }
}
