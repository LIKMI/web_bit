import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_bit/providers/providers_global.dart';
import 'package:web_bit/utils/authentication.dart';
import 'package:web_bit/widgets/auth_dialog.dart';
import 'package:web_bit/screens/main_screen.dart';
import 'package:web_bit/utils/theme_data.dart';
import 'package:web_bit/widgets/flat_button.dart';
import 'package:web_bit/widgets/theme_mode_switch.dart';

class HeaderMenuContents extends StatefulWidget {
  final double opacity;

  HeaderMenuContents(this.opacity);

  @override
  _HeaderMenuContentsState createState() => _HeaderMenuContentsState();
}

class _HeaderMenuContentsState extends State<HeaderMenuContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  // bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
          color:
              Theme.of(context).bottomAppBarColor.withOpacity(widget.opacity),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              spreadRadius: 6,
              blurRadius: 6,
              offset: Offset(0, -4),
            )
          ]),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              child: FlutterLogo(),
            ),
            SizedBox(width: 10),
            Text(homeTitle, style: textTheme.headline1),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: screenSize.width / 8),
                  Flexible(
                    fit: FlexFit.loose,
                    child: InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Text(
                              'Recent Project',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontFamily: textTheme.headline2!.fontFamily,
                                fontWeight: textTheme.headline2!.fontWeight,
                                fontSize: textTheme.headline2!.fontSize,
                                color: _isHovering[0]
                                    ? textTheme.headline2!.decorationColor
                                    : textTheme.headline2!.color,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Flexible(
                            flex: 1,
                            child: Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[0],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: textTheme.headline2!.decorationColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: screenSize.width / 30),
                  Flexible(
                    fit: FlexFit.loose,
                    child: InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[1] = true
                              : _isHovering[1] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Text(
                              'Contribute',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: textTheme.headline2!.fontFamily,
                                fontWeight: textTheme.headline2!.fontWeight,
                                fontSize: textTheme.headline2!.fontSize,
                                color: _isHovering[1]
                                    ? textTheme.headline2!.decorationColor
                                    : textTheme.headline2!.color,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Flexible(
                            flex: 1,
                            child: Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[1],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: textTheme.headline2!.decorationColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: screenSize.width / 30),
                  Flexible(
                    fit: FlexFit.loose,
                    child: InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[2] = true
                              : _isHovering[2] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Text(
                              'Internship',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: textTheme.headline2!.fontFamily,
                                fontWeight: textTheme.headline2!.fontWeight,
                                fontSize: textTheme.headline2!.fontSize,
                                color: _isHovering[2]
                                    ? textTheme.headline2!.decorationColor
                                    : textTheme.headline2!.color,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Flexible(
                            flex: 1,
                            child: Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[2],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: textTheme.headline2!.decorationColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Consumer(builder: (context, watch, _) {
                return ThemeModeSwitch(
                  themeMode: watch(themeModeProvider).state,
                  onThemeMode: (ThemeMode newMode) {
                    context.read(themeModeProvider).state = newMode;
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
