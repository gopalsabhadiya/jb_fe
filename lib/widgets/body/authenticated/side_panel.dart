import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/authenticated_sidepanel.dart';
import 'package:jb_fe/helpers/responsive/responsive_helper.dart';
import 'package:jb_fe/router/delegate.dart';
import 'package:jb_fe/util/authenticated_navbar.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/side_panel_link.dart';
import 'package:jb_fe/widgets/svg/logo_svg.dart';

class SidePanel extends StatefulWidget {
  late final Map<String, bool> _isHovering;

  SidePanel({Key? key}) : super(key: key) {
    _isHovering = _getLinksMap();
  }

  @override
  State<SidePanel> createState() => _SidePanelState();

  Map<String, bool> _getLinksMap() {
    Map<String, bool> hovering = {
      for (var e in AuthenticatedNavbarLinks.LINKS.keys.toList()) e: false
    };
    return hovering;
  }
}

class _SidePanelState extends State<SidePanel> {
  String activeLNK = "dashboard";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ScreenSizeUtil.getSidePanelPadding(),
      width: ScreenSizeUtil.getSidePanelWidth(context),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: LogoSVG(),
          ),
          SizedBox(
            height: 50,
          ),
          Column(
              crossAxisAlignment: ResponsiveHelper.screenWidth(context) < 1200
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: _getLinks(context)),
        ],
      ),
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
            color: AppColors.grey_3.withOpacity(0.5),
            blurRadius: 15.0,
            offset: const Offset(0.0, 0.75))
      ], color: AppColors.white),
    );
  }

  List<Widget> _getLinks(BuildContext context) {
    //return [SidePanelLink(icon: Icons.ac_unit, text: "Hello")];
    return AuthenticatedNavbarLinks.LINKS.entries
        .map<Widget>((entry) => Column(
              children: [
                InkWell(
                  onHover: (value) {
                    setState(() {
                      widget._isHovering[entry.key] = value ? true : false;
                    });
                  },
                  onTap: () {
                    BlocProvider.of<AuthenticatedSidePanelCubit>(context)
                        .navigateTo(entry.key);
                    setState(() {
                      activeLNK = entry.key;
                    });
                    AppRouterDelegate.linkLocationNotifier.value = entry.key;
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    color: activeLNK == entry.key ||
                            (widget._isHovering[entry.key] ?? false)
                        ? AppColors.blue_1
                        : AppColors.white,
                    child: SidePanelLink(
                      icon: AuthenticatedNavbarLinks.LINK_ICONS[entry.key],
                      text: entry.value,
                      isActive: activeLNK == entry.key,
                    ),
                  ),
                ),
                if (activeLNK == entry.key)
                  Container(
                    height: 2,
                    color: AppColors.blue_5,
                  )
              ],
            ))
        .toList();
  }
}
