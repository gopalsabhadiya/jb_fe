import 'package:flutter/cupertino.dart';
import 'package:jb_fe/router/delegate.dart';
import 'package:jb_fe/util/unauthenticated_navbar.dart';
import 'package:jb_fe/widgets/body/unauthenticated/features/features.dart';
import 'package:jb_fe/widgets/body/unauthenticated/home/home.dart';
import 'package:jb_fe/widgets/body/unauthenticated/pricing/pricing.dart';
import 'package:jb_fe/widgets/body/unauthenticated/sign_in/sign_in.dart';

import 'contact_us/contact_us.dart';

class AppBodyUnAuthenticated extends StatefulWidget {
  final ScrollController _scrollController = ScrollController();

  AppBodyUnAuthenticated({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppBody();
  }
}

class _AppBody extends State<AppBodyUnAuthenticated> {
  late List<GlobalKey> keys;

  @override
  void initState() {
    super.initState();
    keys = [
      for (int i = 0; i < UnauthenticatedNavbarLinks.LINKS.length; i++)
        GlobalKey()
    ];
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollToLink();
      AppRouterDelegate.linkLocationNotifier.addListener(() {
        if (widget._scrollController.hasClients) {
          _scrollToLink();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          _onUserScrolled(notification.metrics.pixels);
        }
        return true;
      },
      child: SingleChildScrollView(
        controller: widget._scrollController,
        //physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(key: keys[0], child: const AppHome()),
            Container(key: keys[1], child: const AppFeatures()),
            Container(key: keys[2], child: const AppPricing()),
            Container(key: keys[4], child: const AppSignIn()),
            Container(key: keys[3], child: const AppContactUs()),
          ],
        ),
      ),
    );
  }

  void _onUserScrolled(double offset) {
    double totalItemHeight = 0;
    for (int i = 0; i < keys.length; i++) {
      totalItemHeight += keys[i].currentContext!.size!.height;
      if (totalItemHeight > offset) {
        final String activeLink;
        if (i == keys.length - 2) {
          activeLink = UnauthenticatedNavbarLinks.getLinks()[i + 1];
        } else if (i == keys.length - 1) {
          activeLink = UnauthenticatedNavbarLinks.getLinks()[i - 1];
        } else {
          activeLink = UnauthenticatedNavbarLinks.getLinks()[i];
        }
        AppRouterDelegate.linkLocationNotifier.value = activeLink;
        break;
      }
    }
  }

  void _scrollToLink() {
    Scrollable.ensureVisible(
      keys[_getLinkIndex()].currentContext!,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  _getLinkIndex() {
    if (UnauthenticatedNavbarLinks.LINKS
        .containsKey(AppRouterDelegate.linkLocationNotifier.value)) {
      String? link = AppRouterDelegate.linkLocationNotifier.value;
      return UnauthenticatedNavbarLinks.getIndex(key: link);
    }
    AppRouterDelegate.linkLocationNotifier.value =
        UnauthenticatedNavbarLinks.DEFAULT_ACTIVE_LINK;
    return UnauthenticatedNavbarLinks.getIndex(
        key: UnauthenticatedNavbarLinks.DEFAULT_ACTIVE_LINK);
  }
}
