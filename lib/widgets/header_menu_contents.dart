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

  bool _isProcessing = false;

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
                          Text(
                            'Recent Project',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: textTheme.headline2!.fontFamily,
                              fontWeight: textTheme.headline2!.fontWeight,
                              fontSize: textTheme.headline2!.fontSize,
                              color: _isHovering[0]
                                  ? textTheme.headline2!.decorationColor
                                  : textTheme.headline2!.color,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: textTheme.headline2!.decorationColor,
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
                          Text(
                            'How To Contribute',
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
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[1],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: textTheme.headline2!.decorationColor,
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
            Consumer(builder: (context, watch, _) {
              return ThemeModeSwitch(
                themeMode: watch(themeModeProvider).state,
                onThemeMode: (ThemeMode newMode) {
                  context.read(themeModeProvider).state = newMode;
                },
              );
            }),
            SizedBox(
              width: screenSize.width / 50,
            ),
            userEmail == null
                ? CustomFlatButton(
                    textStyle: textTheme.button,
                    onPressed: userEmail == null
                        ? () {
                            showDialog(
                              context: context,
                              builder: (context) => AuthDialog(),
                            );
                          }
                        : null,
                    childWidget: Text(
                      'Sign in',
                    ),
                  )
                : Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            imageUrl != null ? NetworkImage(imageUrl!) : null,
                        child: imageUrl == null
                            ? Icon(
                                Icons.account_circle,
                                size: 30,
                              )
                            : Container(),
                      ),
                      SizedBox(width: 5),
                      Text(
                        (name ?? userEmail)!,
                        style: textTheme.headline2,
                      ),
                      SizedBox(width: 10),
                      CustomFlatButton(
                        textStyle: textTheme.button,
                        onPressed: _isProcessing
                            ? null
                            : () async {
                                setState(() {
                                  _isProcessing = true;
                                });
                                await signOut().then((result) {
                                  print(result);
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) => MainScreen(),
                                    ),
                                  );
                                }).catchError((error) {
                                  print('Sign Out Error: $error');
                                });
                                setState(() {
                                  _isProcessing = false;
                                });
                              },
                        childWidget: Padding(
                          padding: EdgeInsets.only(
                            top: 8.0,
                            bottom: 8.0,
                          ),
                          child: _isProcessing
                              ? CircularProgressIndicator(
                                  backgroundColor: textTheme.button!.color,
                                )
                              : Text('Sign out'),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
