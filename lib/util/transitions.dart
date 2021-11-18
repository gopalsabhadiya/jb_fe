import 'package:flutter/cupertino.dart';

class AppTransitions {
  static FadeTransition fadeTransitionBuilder(
      Widget child, Animation<double> animation) {
    return FadeTransition(
        child: child,
        opacity: Tween<double>(begin: 0, end: 1).animate(animation));
  }

  static ScaleTransition scaleTransitionBuilder(
      Widget child, Animation<double> animation) {
    return ScaleTransition(child: child, scale: animation);
  }

  static SlideTransition slideTransitionBuilder(
      Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
