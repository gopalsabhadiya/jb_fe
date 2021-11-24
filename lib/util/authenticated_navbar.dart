import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/links/navbar.dart';

class AuthenticatedNavbarLinks {
  static final Map<String, String> LINKS = {
    NavbarLinks.A_DASHBOARD_KEY: NavbarLinks.A_DASHBOARD_VALUE,
    NavbarLinks.A_PARTY_KEY: NavbarLinks.A_PARTY_VALUE,
    NavbarLinks.A_INVENTORY_KEY: NavbarLinks.A_INVENTORY_VALUE,
    NavbarLinks.A_ORDERS_KEY: NavbarLinks.A_ORDERS_VALUE,
    NavbarLinks.A_PAYMENTS_KEY: NavbarLinks.A_PAYMENTS_VALUE,
    NavbarLinks.A_SHOP_EXPENSES_KEY: NavbarLinks.A_SHOP_EXPENSES_VALUE,
  };

  static final Map<String, IconData> LINK_ICONS = {
    NavbarLinks.A_DASHBOARD_KEY: Icons.dashboard,
    NavbarLinks.A_PARTY_KEY: Icons.account_circle,
    NavbarLinks.A_INVENTORY_KEY: Icons.inventory_2,
    NavbarLinks.A_ORDERS_KEY: Icons.shopping_bag,
    NavbarLinks.A_PAYMENTS_KEY: Icons.payment,
    NavbarLinks.A_SHOP_EXPENSES_KEY: Icons.storefront,
  };

  static const DEFAULT_ACTIVE_LINK = "dashboard";

  static List<IconData> getLinkIcons() => LINK_ICONS.values.toList();

  static List<String> getLinks() => LINK_ICONS.keys.toList();

  static int getIndex({required String key}) {
    return getLinks().indexOf(key);
  }
}
