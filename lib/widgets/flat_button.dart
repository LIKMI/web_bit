import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  CustomFlatButton(
      {this.onPressed,
      this.childWidget,
      this.textStyle,
      this.color = Colors.red,
      this.accentColor = Colors.redAccent});
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
