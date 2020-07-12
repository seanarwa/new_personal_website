import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_website/widgets/home/header.dart';

class HomePage extends StatefulWidget {

  static final String route = "/";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ValueNotifier<double> _valueNotifier = ValueNotifier<double>(0);
  PageController _pageController = PageController();
  TweenSequence<Color> _tweenSequence;

  TweenSequenceItem<Color> _getTweenSequenceItem({
    Color begin = Colors.black,
    Color end = Colors.white,
  }) {
    return TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: begin,
        end: end,
      ),
    );
  }

  @override
  void initState() {
    _tweenSequence = TweenSequence<Color>([
      _getTweenSequenceItem(begin: Color(0xFFFFB6B9), end: Color(0xFFFAE3D9)),
      _getTweenSequenceItem(begin: Color(0xFFFAE3D9), end: Color(0xFFBBDED6)),
      _getTweenSequenceItem(begin: Color(0xFFBBDED6), end: Color(0xFF61C0BF)),
      _getTweenSequenceItem(begin: Color(0xFF61C0BF), end: Color(0xFF61C0BF)),
    ]);
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  Widget _renderPageView() {
    return PageView(
      pageSnapping: true,
      physics: BouncingScrollPhysics(),
      controller: _pageController,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Header(onDownButtonPressed: () {
          _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
        }),
        Center(
          child: Text(
            "Page2",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        Center(
          child: Text(
            "Page3",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        Center(
          child: Text(
            "Page4",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          final color = _pageController.hasClients ? _pageController.page / 3 : .0;
          return DecoratedBox(
            decoration: BoxDecoration(
              color: _tweenSequence.evaluate(AlwaysStoppedAnimation(color)),
            ),
            child: child,
          );
        },
        child: _renderPageView(),
      ),
    );
  }
}