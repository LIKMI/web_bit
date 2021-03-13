import 'package:flutter/material.dart';
import 'package:web_bit/utils/theme/theme_data.dart';
import 'package:web_bit/widgets/responsive.dart';
import 'package:web_bit/widgets/header_menu_contents.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.brightness_6),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    // DynamicTheme.of(context).setBrightness(
                    //     Theme.of(context).brightness == Brightness.dark
                    //         ? Brightness.light
                    //         : Brightness.dark);
                    // print(Theme.of(context).brightness);
                  },
                ),
              ],
              title: Text(homeTitle, style: titleTextStyle),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: HeaderMenuContents(_opacity),
            ), 
      body: Container(
        child: SizedBox(
          height: screenSize.height * 0.45,
          width: screenSize.width,
          child: Image.asset(
            'assets/images/cover.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
