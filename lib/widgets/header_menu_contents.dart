import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_bit/providers/providers_global.dart';
import 'package:web_bit/utils/authentication.dart';
import 'package:web_bit/widgets/auth_dialog.dart';
import 'package:web_bit/screens/home_page.dart';
import 'package:web_bit/utils/theme_data.dart';
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
    final primaryTextTheme = Theme.of(context).primaryTextTheme;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Theme.of(context).bottomAppBarColor.withOpacity(widget.opacity),
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
              Text(
                homeTitle,
                style: TextStyle(
                  color: primaryTextTheme.subtitle1!.color,
                  fontSize: 20,
                  fontFamily: 'Proxima Nova',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 3,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenSize.width / 8),
                    InkWell(
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
                            style: TextStyle(
                              fontFamily: 'Proxima Nova',
                              fontSize: 15.0,
                              color: _isHovering[0]
                                  ? primaryTextTheme.subtitle1!.decorationColor
                                  : primaryTextTheme.subtitle1!.color,
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
                              color:
                                  primaryTextTheme.subtitle1!.decorationColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
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
                            style: TextStyle(
                              fontFamily: 'Proxima Nova',
                              fontSize: 15.0,
                              color: _isHovering[1]
                                  ? primaryTextTheme.subtitle1!.decorationColor
                                  : primaryTextTheme.subtitle1!.color,
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
                              color:
                                  primaryTextTheme.subtitle1!.decorationColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[3] = true : _isHovering[3] = false;
                  });
                },
                onTap: userEmail == null
                    ? () {
                        showDialog(
                          context: context,
                          builder: (context) => AuthDialog(),
                        );
                      }
                    : null,
                child: userEmail == null
                    ? Text(
                        'Sign in',
                        style: TextStyle(
                          color: _isHovering[3]
                              ? primaryTextTheme.subtitle1!.decorationColor
                              : primaryTextTheme.subtitle1!.color,
                        ),
                      )
                    : Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: imageUrl != null
                                ? NetworkImage(imageUrl!)
                                : null,
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
                            style: TextStyle(
                              fontFamily: 'Proxima Nova',
                              color: _isHovering[3]
                                  ? primaryTextTheme.subtitle1!.decorationColor
                                  : primaryTextTheme.subtitle1!.color,
                            ),
                          ),
                          SizedBox(width: 10),
                          TextButton(
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
                                          builder: (context) => HomePage(),
                                        ),
                                      );
                                    }).catchError((error) {
                                      print('Sign Out Error: $error');
                                    });
                                    setState(() {
                                      _isProcessing = false;
                                    });
                                  },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 8.0,
                                bottom: 8.0,
                              ),
                              child: _isProcessing
                                  ? CircularProgressIndicator()
                                  : Text(
                                      'Sign out',
                                      style: TextStyle(
                                        fontFamily: 'Proxima Nova',
                                        fontSize: 14,
                                        color: primaryTextTheme.subtitle1!.color,
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
