import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:web_bit/models/menu_model.dart';
import 'package:web_bit/utils/authentication.dart';
import 'package:web_bit/utils/custom_colors.dart';
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
              leading: FittedBox(
                fit: BoxFit.scaleDown,
                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => _openDrawer(),
                ),
              ),
              titleSpacing: 5,
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: [
                    FlutterLogo(),
                    Text(homeTitle, style: textTheme.headline1),
                  ],
                ),
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
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: DrawerHeaderMain(),
              ),
              Flexible(
                flex: 6,
                child: DrawerMain(),
              ),
              Flexible(flex: 1, child: DrawerFooter())
            ],
          ),
        ),
      ),
      floatingActionButton: (ResponsiveWidget.isMediumScreen(context) ||
              ResponsiveWidget.isLargeScreen(context))
          ? FittedBox(
              fit: BoxFit.scaleDown,
              child: FloatingActionButton.extended(
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
            )
          : SizedBox.shrink(),
    );
  }
}

class DrawerHeaderMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DrawerHeader(
      margin: EdgeInsets.zero,
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
                    child: Text('Account', style: textTheme.headline2),
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
                      onTap: () => Navigator.of(context).pop(),
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
    );
  }
}

class DrawerMain extends StatefulWidget {
  @override
  _DrawerMainState createState() => _DrawerMainState();
}

class _DrawerMainState extends State<DrawerMain> {
  int _indexNow = -1;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scrollbar(
      isAlwaysShown: true,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 5),
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
            child: Card(
              clipBehavior: Clip.antiAlias,
              color: Theme.of(context).bottomAppBarColor,
              child: ListTile(
                tileColor: _indexNow == index
                    ? textTheme.headline2!.decorationColor
                    : WHITE,
                enableFeedback: true,
                title: Text(menuModel[index].title,
                    style: TextStyle(
                      fontFamily: textTheme.headline2!.fontFamily,
                      fontWeight: textTheme.headline2!.fontWeight,
                      fontSize: textTheme.headline2!.fontSize,
                      color: _indexNow == index
                          ? WHITE
                          : textTheme.headline2!.color,
                    )),
                trailing: Icon(
                  menuModel[index].icon,
                  color:
                      _indexNow == index ? WHITE : textTheme.headline2!.color,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class DrawerFooter extends StatefulWidget {
  @override
  _DrawerFooterState createState() => _DrawerFooterState();
}

class _DrawerFooterState extends State<DrawerFooter> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
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
          : CustomFlatButton(
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
    );
  }
}
