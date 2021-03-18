import 'package:flutter/material.dart';

@immutable
class ThemeModeSwitch extends StatefulWidget {
  const ThemeModeSwitch({
    Key? key,
    required this.themeMode,
    required this.onThemeMode,
  });
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeMode;

  @override
  _ThemeModeSwitchState createState() => _ThemeModeSwitchState();
}

class _ThemeModeSwitchState extends State<ThemeModeSwitch> {
  List<bool> _isSelected = [];

  @override
  void initState() {
    _isSelected = [
      widget.themeMode == ThemeMode.light,
      widget.themeMode == ThemeMode.system,
      widget.themeMode == ThemeMode.dark,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final toggleButtonsTheme = Theme.of(context).toggleButtonsTheme;
    return ToggleButtons(
      isSelected: _isSelected,
      selectedColor: toggleButtonsTheme.selectedColor,
      color: toggleButtonsTheme.color,
      splashColor: toggleButtonsTheme.splashColor,
      borderWidth: 0,
      renderBorder: false,
      onPressed: (int newIndex) {
        setState(() {
          for (int index = 0; index < _isSelected.length; index++) {
            if (index == newIndex) {
              _isSelected[index] = true;
            } else {
              _isSelected[index] = false;
            }
          }
        });
        if (newIndex == 0) {
          widget.onThemeMode(ThemeMode.light);
        } else if (newIndex == 2) {
          widget.onThemeMode(ThemeMode.dark);
        } else {
          widget.onThemeMode(ThemeMode.system);
        }
      },
      children: const <Widget>[
        Icon(Icons.wb_sunny),
        Icon(Icons.phone_iphone),
        Icon(Icons.bedtime),
      ],
    );
  }
}
