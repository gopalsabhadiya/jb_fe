import 'package:flutter/cupertino.dart';

import 'add_item_button.dart';
import 'item_seearch_bar.dart';

class NavbarInventoryContent extends StatelessWidget {
  const NavbarInventoryContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        ItemSearchBar(),
        // const FilterItemButton(),
        AddItemButton()
      ],
    );
  }
}
