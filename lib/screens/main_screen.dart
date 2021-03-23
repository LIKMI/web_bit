import 'package:flutter/material.dart';
import 'package:web_bit/utils/theme_data.dart';
import 'package:web_bit/widgets/flat_button.dart';
import 'package:web_bit/widgets/responsive.dart';
import 'package:web_bit/widgets/header_menu_contents.dart';

class MainScreen extends StatefulWidget {
  static const String route = '/';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late ScrollController _scrollController;
  double _scrollPosition = 0; // Turn off opacity on scroll (default 0)
  double _opacity = 1; // Turn off opacity on scroll (default 0)

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    final Brightness brightness =
        WidgetsBinding.instance!.window.platformBrightness;
    //inform listeners and rebuild widget tree *Not Implemented
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var screenSize = MediaQuery.of(context).size;
    // Turn off opacity on scroll (default used)
    // _opacity = _scrollPosition < screenSize.height * 0.30
    //     ? _scrollPosition / (screenSize.height * 0.30)
    //     : 1;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar:
          false, // Turn off opacity on scroll (default true)
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              iconTheme: IconThemeData(
                color: textTheme.headline1!.color,
              ),
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 6,
              shadowColor: Theme.of(context).shadowColor,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  FlutterLogo(),
                  Text(homeTitle, style: textTheme.headline1),
                ],
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: HeaderMenuContents(_opacity),
            ),
      body: Container(
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height * 0.45,
                width: screenSize.width,
                child: Image.asset(
                  'assets/images/1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                  height: screenSize.height * 0.45, width: screenSize.width),
              SizedBox(
                height: screenSize.height * 0.45,
                width: screenSize.width,
                child: Image.asset(
                  'assets/images/europe.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.45,
                width: screenSize.width,
                child: Image.asset(
                  'assets/images/asia.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 4,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Account', style: textTheme.headline2),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: CustomFlatButton(
                                    childWidget: Text(
                                      'Login',
                                      style: textTheme.button,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Flexible(
                                  flex: 1,
                                  child: CustomFlatButton(
                                    childWidget: Icon(
                                      Icons.close,
                                      color: textTheme.button!.color,
                                    ),
                                    onPressed: () => _closeDrawer(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).bottomAppBarColor,
                ),
              ),
              ListTile(
                title: Text('Menu', style: textTheme.headline2),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _openDrawer();
        },
        label: Text('Menu'),
        icon: Icon(Icons.menu),
      ),
    );
  }
}
