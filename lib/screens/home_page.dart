import 'package:flutter/material.dart';
import 'package:web_bit/utils/theme_data.dart';
import 'package:web_bit/widgets/responsive.dart';
import 'package:web_bit/widgets/header_menu_contents.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
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
    var screenSize = MediaQuery.of(context).size;
    // Turn off opacity on scroll
    // _opacity = _scrollPosition < screenSize.height * 0.30
    //     ? _scrollPosition / (screenSize.height * 0.30)
    //     : 1;
    _opacity = 1;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: false, // Turn off opacity on scroll
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
              actions: [
              ],
              title: Text(homeTitle, style: titleTextStyle),
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
              height: screenSize.height * 0.45,
              width: screenSize.width
            ),
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
      )),
    );
  }
}
