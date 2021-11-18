import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';
import 'package:jb_fe/controllers/bloc/drawer.dart';
import 'package:jb_fe/controllers/bloc/state/drawer.dart';
import 'package:jb_fe/util/global_keys.dart';
import 'package:jb_fe/util/unauthenticated_navbar.dart';
import 'package:jb_fe/widgets/svg/logo_svg.dart';

class SideHamburgerUnauthenticatedNavbar extends StatefulWidget {
  final List<String> _links = UnauthenticatedNavbarLinks.getLinks();
  late final Map<String, bool> _isHovering;

  SideHamburgerUnauthenticatedNavbar({Key? key}) : super(key: key) {
    _isHovering = _getLinksMap(_links);
  }

  @override
  State<StatefulWidget> createState() {
    return _SideHamburgerUnauthenticatedNavbar();
  }

  static Map<String, bool> _getLinksMap(List<String> links) {
    Map<String, bool> hovering = {for (var e in links) e: false};
    return hovering;
  }
}

class _SideHamburgerUnauthenticatedNavbar
    extends State<SideHamburgerUnauthenticatedNavbar>
    with SingleTickerProviderStateMixin {
  final double _paddingLR = 20;
  final double _opacity = 0.75;
  final Color _color = AppColors.black;

  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: AnimationDuration.SHORT);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerBloc, DrawerState>(
      builder: (BuildContext context, DrawerState state) {
        _toggleAnimation(state);
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: _animationController,
                  size: 30,
                ),
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  if (AppGlobalKeys
                      .UNAUTH_BODY_SCAFFOLD.currentState!.isDrawerOpen) {
                    AppGlobalKeys.UNAUTH_BODY_SCAFFOLD.currentState!
                        .openEndDrawer();
                  } else {
                    AppGlobalKeys.UNAUTH_BODY_SCAFFOLD.currentState!
                        .openDrawer();
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: LogoSVG(),
              ),
            ],
          ),
        );
      },
    );
  }

  void _toggleAnimation(DrawerState drawerState) {
    switch (drawerState) {
      case DrawerState.OPEN:
        _animationController.forward();
        break;
      case DrawerState.CLOSED:
        _animationController.reverse();
        break;
    }
  }
}
