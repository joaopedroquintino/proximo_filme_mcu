import 'dart:math';

import 'package:flutter/material.dart';

class MarvelLoadingWidget extends StatefulWidget {
  const MarvelLoadingWidget({Key? key}) : super(key: key);

  @override
  _MarvelLoadingWidgetState createState() => _MarvelLoadingWidgetState();
}

class _MarvelLoadingWidgetState extends State<MarvelLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation rotatingAnimation;
  late Animation scalingAnimation;

  final icons = <Widget>[
    Image.asset(_asset('mjolnir.png')),
    Image.asset(_asset('shield.png')),
    Image.asset(_asset('spider.png')),
    Image.asset(_asset('arch.png')),
  ];

  static String _asset(String name) {
    return 'assets/images/$name';
  }

  late Widget selectedIcon;

  static int iconIndex = 0;

  void changeIcon() {
    setState(() {
      selectedIcon = icons[++iconIndex % icons.length];
    });
  }

  @override
  void initState() {
    super.initState();

    selectedIcon = icons[0];

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        changeIcon();
        _animationController.forward();
      } else if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });

    rotatingAnimation = Tween(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    scalingAnimation = Tween(begin: 0.3, end: 2.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Transform.rotate(
            angle: rotatingAnimation.value,
            child: Transform.scale(
              scale: scalingAnimation.value,
              child: selectedIcon,
            ),
          );
        },
      ),
    );
  }
}
