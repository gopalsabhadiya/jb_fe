import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/enum/screen_type.dart';

class AppGlobalKeys {
  static final GlobalKey<ScaffoldState> UNAUTH_BODY_SCAFFOLD =
      GlobalKey<ScaffoldState>();
  static final GlobalKey<ScaffoldState> UNAUTH_APPBAR_SCAFFOLD =
      GlobalKey<ScaffoldState>();

  static final GlobalKey<ScaffoldState> AUTH_BODY_SCAFFOLD =
      GlobalKey<ScaffoldState>();
  static final GlobalKey<ScaffoldState> AUTH_APPBAR_SCAFFOLD =
      GlobalKey<ScaffoldState>();

  static getBodyScaffoldKey(ScreenTypeEnum type) {
    switch (type) {
      case ScreenTypeEnum.AUTHENTICATED:
        return AUTH_BODY_SCAFFOLD;
      case ScreenTypeEnum.UNAUTHENTICATED:
        return UNAUTH_BODY_SCAFFOLD;
    }
  }
}
