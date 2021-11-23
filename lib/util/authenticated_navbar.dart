import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/links/navbar.dart';

class AuthenticatedNavbarLinks {
  static final Map<String, IconData> LINK_ICONS = {
    NavbarLinks.A_NOTIFICATION_KEY: Icons.notifications,
    NavbarLinks.A_CART_KEY: Icons.shopping_cart,
    NavbarLinks.A_ACCOUNT_KEY: Icons.account_circle
  };

  static List<IconData> getLinkIcons() => LINK_ICONS.values.toList();

  static List<String> getLinks() => LINK_ICONS.keys.toList();

  static int getIndex({required String key}) {
    return getLinks().indexOf(key);
  }
}
