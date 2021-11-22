import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/enum/navbar_types_enum.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/regular_top.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/side_hamburger.dart';
import 'package:jb_fe/widgets/navbar/content/unauthenticated/regular_top.dart';
import 'package:jb_fe/widgets/navbar/content/unauthenticated/side_hamburger.dart';

class NavbarContent extends StatefulWidget {
  final NavbarTypes navbarType;

  const NavbarContent({Key? key, required this.navbarType}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NavbarContent();
  }
}

class _NavbarContent extends State<NavbarContent> {
  final double _paddingLR = 20;
  final double _opacity = 0.75;
  final Color _color = AppColors.black;

  @override
  Widget build(BuildContext context) {
    switch (widget.navbarType) {
      case NavbarTypes.REGULAR_TOP_UNAUTHENTICATED:
        return RegularTopUnauthenticatedNavbar();
      case NavbarTypes.SIDE_HAMBURGER_UNAUTHENTICATED:
        return const SideHamburgerUnauthenticatedNavbar();
      case NavbarTypes.REGULAR_TOP_AUTHENTICATED:
        return const RegularTopAuthenticatedNavbar();
      case NavbarTypes.REGULAR_SIDE_AUTHENTICATED:
        // TODO: Handle this case.
        break;
      case NavbarTypes.SIDE_HAMBURGER_AUTHENTICATED:
        return const HamburgerTopAuthenticatedNavbar();
      default:
        return RegularTopUnauthenticatedNavbar();
    }
    return RegularTopUnauthenticatedNavbar();
  }
}
