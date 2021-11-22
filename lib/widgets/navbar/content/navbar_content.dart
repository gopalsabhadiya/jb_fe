import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/enum/navbar_types_enum.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/regular_top.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/side_hamburger.dart';
import 'package:jb_fe/widgets/navbar/content/unauthenticated/regular_top.dart';
import 'package:jb_fe/widgets/navbar/content/unauthenticated/side_hamburger.dart';

class NavbarContent extends StatelessWidget {
  final NavbarTypes navbarType;

  const NavbarContent({Key? key, required this.navbarType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (navbarType) {
      case NavbarTypes.REGULAR_TOP_UNAUTHENTICATED:
        return RegularTopUnauthenticatedNavbar();
      case NavbarTypes.HAMBURGER_TOP_UNAUTHENTICATED:
        return const HamburgerTopUnauthenticatedNavbar();
      case NavbarTypes.REGULAR_TOP_AUTHENTICATED:
        return const RegularTopAuthenticatedNavbar();
      case NavbarTypes.REGULAR_SIDE_AUTHENTICATED:
        // TODO: Handle this case.
        break;
      case NavbarTypes.HAMBURGER_TOP_AUTHENTICATED:
        return const HamburgerTopAuthenticatedNavbar();
      default:
        return RegularTopUnauthenticatedNavbar();
    }
    return RegularTopUnauthenticatedNavbar();
  }
}
