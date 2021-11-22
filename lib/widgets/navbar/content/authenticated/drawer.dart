import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/helpers/responsive/responsive_helper.dart';
import 'package:jb_fe/router/delegate.dart';
import 'package:jb_fe/util/global_keys.dart';
import 'package:jb_fe/util/unauthenticated_navbar.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class AuthenticatedDrawer extends StatefulWidget {
  late final Map<String, bool> _isHovering;

  AuthenticatedDrawer({Key? key}) : super(key: key) {
    _isHovering = _getLinksMap();
  }

  @override
  State<AuthenticatedDrawer> createState() => _AuthenticatedDrawerState();

  Map<String, bool> _getLinksMap() {
    Map<String, bool> hovering = {
      for (var e in UnauthenticatedNavbarLinks.LINKS.keys.toList()) e: false
    };
    return hovering;
  }
}

class _AuthenticatedDrawerState extends State<AuthenticatedDrawer> {
  String? get activeLink {
    return AppRouterDelegate.linkLocationNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveHelper.screenWidth(context),
      color: AppColors.black,
      child: Drawer(
        child: AppTextBuilder("Helllo User").build()
      ),
    );
  }

  List<Widget> _getLinks() {
    return UnauthenticatedNavbarLinks.LINKS.entries
        .map<Widget>((entry) => (InkWell(
              onHover: (value) {
                setState(() {
                  widget._isHovering[entry.key] = value ? true : false;
                });
              },
              onTap: () {
                AppRouterDelegate.linkLocationNotifier.value = entry.key;
                AppGlobalKeys.UNAUTH_BODY_SCAFFOLD.currentState!
                    .openEndDrawer();
              },
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                UnauthenticatedNavbarLinks
                                    .LINK_ICONS[entry.key],
                                color: AppColors.blue_5,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              AppTextBuilder(entry.value)
                                  .color(AppColors.blue_5)
                                  .weight(entry.key == activeLink
                                      ? AppFontWeight.BOLD
                                      : AppFontWeight.LIGHT)
                                  .build()
                            ],
                          ),
                          const Icon(Icons.navigate_next_outlined,
                              color: AppColors.blue_5),
                        ],
                      ),
                    ),
                    decoration: ShapeDecoration(
                      color: entry.key == activeLink ||
                              (widget._isHovering[entry.key] ?? false)
                          ? AppColors.blue_1
                          : AppColors.white,
                      shape: StadiumBorder(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      height: 2,
                      color: AppColors.grey_2,
                    ),
                  )
                ],
              ),
            )))
        .toList();
  }
}
