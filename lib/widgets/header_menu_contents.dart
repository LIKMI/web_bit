import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_bit/models/menu_model.dart';
import 'package:web_bit/providers/providers_global.dart';
import 'package:web_bit/utils/theme_data.dart';
import 'package:web_bit/widgets/theme_mode_switch.dart';

class HeaderMenuContents extends StatefulWidget {
  final double opacity;

  HeaderMenuContents(this.opacity);

  @override
  _HeaderMenuContentsState createState() => _HeaderMenuContentsState();
}

class _HeaderMenuContentsState extends State<HeaderMenuContents> {
  int _indexNow = -1;

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      width: 30,
                      height: 30,
                      child: FlutterLogo(),
                    ),
                  ),
                  SizedBox(width: 3),
                  Flexible(
                    flex: 3,
                    child: Text(homeTitle,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.headline1),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 5,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: menuModel.length,
                itemBuilder: (context, index) {
                  return MouseRegion(
                    onHover: (event) {
                      setState(() {
                        _indexNow = index;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        _indexNow = -1;
                      });
                    },
                    child: GestureDetector(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Text(
                              menuModel[index].title,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontFamily: textTheme.headline2!.fontFamily,
                                fontWeight: textTheme.headline2!.fontWeight,
                                fontSize: textTheme.headline2!.fontSize,
                                color: _indexNow == index
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
                              visible: _indexNow == index ? true : false,
                              child: Container(
                                height: 2,
                                width: 20,
                                color: textTheme.headline2!.decorationColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                            context, menuModel[index].routeName);
                      },
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 20);
                },
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerRight,
                child: FittedBox(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
