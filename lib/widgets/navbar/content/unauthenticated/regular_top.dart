import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/router/delegate.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/util/unauthenticated_navbar.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/svg/logo_svg.dart';

class RegularTopUnauthenticatedNavbar extends StatefulWidget {
  final LinkedHashMap<String, String> _links = UnauthenticatedNavbarLinks.LINKS;
  late final Map<String, bool> _isHovering;

  RegularTopUnauthenticatedNavbar({Key? key}) : super(key: key) {
    _isHovering = _getLinksMap();
  }

  @override
  State<StatefulWidget> createState() {
    return _RegularTopUnauthenticatedNavbar();
  }

  Map<String, bool> _getLinksMap() {
    Map<String, bool> hovering = {for (var e in _links.keys.toList()) e: false};
    return hovering;
  }
}

class _RegularTopUnauthenticatedNavbar
    extends State<RegularTopUnauthenticatedNavbar> {
  final double _paddingLR = 20;
  final double _opacity = 0.75;

  String? get activeLink {
    return AppRouterDelegate.linkLocationNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppRouterDelegate.linkLocationNotifier,
      builder: (BuildContext context, String? value, Widget? child) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoSVG(),
              SizedBox(
                width: ScreenSizeUtil.getNavbarMiddlePadding(context),
              ),
              Row(
                children: widget._links.entries
                    .map<Widget>((entry) => _getLinkWidget(entry))
                    .toList(),
              ),
            ],
          ),
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: AppColors.grey_3.withOpacity(0.5),
                  blurRadius: 10.0,
                  offset: const Offset(10, 0))
            ],
            color: AppColors.white,
          ),
        );
      },
    );
  }

  _getLinkWidget(MapEntry linkEntry) {
    String linkKey = linkEntry.key;
    String linkValue = linkEntry.value;
    return InkWell(
      onHover: (value) {
        setState(() {
          widget._isHovering[linkKey] = value ? true : false;
        });
      },
      onTap: () {
        AppRouterDelegate.linkLocationNotifier.value = linkKey;
      },
      child: Container(
        color: linkKey == activeLink || (widget._isHovering[linkKey] ?? false)
            ? AppColors.blue_1
            : AppColors.white,
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              AppTextBuilder(linkValue)
                  .size(ScreenSizeUtil.getNavbarLinkFontSize(context))
                  .paddingHorizontal(_paddingLR)
                  .opacity(_opacity)
                  .color(linkKey == activeLink
                      ? AppColors.blue_5
                      : AppColors.black)
                  .build(),
              Visibility(
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  visible: linkKey == activeLink ||
                      (widget._isHovering[linkKey] ?? false),
                  child: Container(
                    height: 2,
                    color: AppColors.blue_5,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
