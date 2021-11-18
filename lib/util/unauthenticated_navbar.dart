import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/links/navbar.dart';

class UnauthenticatedNavbarLinks {
  static final LinkedHashMap<String, String> LINKS = LinkedHashMap.from({
    NavbarLinks.UA_HOME_KEY: NavbarLinks.UA_HOME_VALUE,
    NavbarLinks.UA_FEATURES_KEY: NavbarLinks.UA_FEATURES_VALUE,
    NavbarLinks.UA_PRICING_KEY: NavbarLinks.UA_PRICINGG_VALUE,
    NavbarLinks.UA_CONTACT_US_KEY: NavbarLinks.UA_CONTACT_US_VALUE,
    NavbarLinks.UA_SIGN_IN_KEY: NavbarLinks.UA_SIGN_IN_VALUE
  });
  static final Map<String, IconData> LINK_ICONS = {
    NavbarLinks.UA_HOME_KEY: Icons.home_outlined,
    NavbarLinks.UA_FEATURES_KEY: Icons.auto_awesome_outlined,
    NavbarLinks.UA_PRICING_KEY: Icons.sell_outlined,
    NavbarLinks.UA_CONTACT_US_KEY: Icons.phone_outlined,
    NavbarLinks.UA_SIGN_IN_KEY: Icons.login_outlined
  };

  static const DEFAULT_ACTIVE_LINK = "home";

  static List<String> getLinkValues() => LINKS.values.toList();

  static List<String> getLinks() => LINKS.keys.toList();

  static int getIndex({String? key, String? value}) {
    if (key != null) {
      return getLinks().indexOf(key);
    } else if (value != null) {
      return getLinkValues().indexOf(value);
    }
    return 0;
  }

  static String getDefaultActiveLink() {
    return getLinks()[0];
  }
}
