import 'package:flutter/material.dart';
import 'package:web_bit/utils/authentication.dart';
import 'package:web_bit/utils/theme_data.dart';
import 'package:web_bit/widgets/auth_dialog.dart';
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
  bool _isProcessing = false;

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
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child:
                                  Text('Account', style: textTheme.headline2),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                child: Icon(
                                  Icons.close,
                                  color: textTheme.headline2!.color,
                                ),
                                onTap: () => _closeDrawer(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      flex: 3,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: userEmail != null && imageUrl != null
                            ? NetworkImage(imageUrl!)
                            : null,
                        child: imageUrl == null
                            ? Icon(
                                Icons.account_circle,
                                size: 30,
                              )
                            : SizedBox.shrink(),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        userEmail == null ? 'Guest' : (name ?? userEmail)!,
                        style: textTheme.headline2,
                      ),
                    )
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
              Center(
                child: userEmail == null
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
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _openDrawer();
        },
        label: Text(
          'Menu',
          style: textTheme.button,
        ),
        icon: Icon(
          Icons.menu,
          size: textTheme.button!.fontSize,
        ),
      ),
    );
  }
}
