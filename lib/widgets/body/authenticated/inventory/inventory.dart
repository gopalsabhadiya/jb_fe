import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/add_edit/edit_item.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/card/item_card.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  bool showEditItemDrawer = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Wrap(
                    clipBehavior: Clip.hardEdge,
                    spacing: 40,
                    runSpacing: 40,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      ItemCard(
                        itemId: "1",
                        onItemEdit: _onItemEdit,
                      ),
                      ItemCard(
                        itemId: "2",
                        onItemEdit: _onItemEdit,
                      ),
                      ItemCard(
                        itemId: "3",
                        onItemEdit: _onItemEdit,
                      ),
                      ItemCard(
                        itemId: "4",
                        onItemEdit: _onItemEdit,
                      ),
                      ItemCard(
                        itemId: "5",
                        onItemEdit: _onItemEdit,
                      ),
                      ItemCard(
                        itemId: "6",
                        onItemEdit: _onItemEdit,
                      ),
                      ItemCard(
                        itemId: "7",
                        onItemEdit: _onItemEdit,
                      ),
                      ItemCard(
                        itemId: "8",
                        onItemEdit: _onItemEdit,
                      ),
                      ItemCard(
                        itemId: "9",
                        onItemEdit: _onItemEdit,
                      ),
                      ItemCard(
                        itemId: "10",
                        onItemEdit: _onItemEdit,
                      ),
                      ItemCard(
                        itemId: "11",
                        onItemEdit: _onItemEdit,
                      ),
                      ItemCard(
                        itemId: "12",
                        onItemEdit: _onItemEdit,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
              width: ScreenSizeUtil.getBottomDrawerWidth(context),
              height: ScreenSizeUtil.getBottomDrawerHeight(context),
              curve: Curves.easeOut,
              duration: AnimationDuration.SHORT,
              top: showEditItemDrawer ? 0 : MediaQuery.of(context).size.height,
              child: EditItem(
                toggleDrawer: _toggleDrawer,
              )),
        ],
      ),
    );
  }

  _toggleDrawer() {
    setState(() {
      showEditItemDrawer = !showEditItemDrawer;
    });
  }

  _onItemEdit(String id) {
    setState(() {
      showEditItemDrawer = !showEditItemDrawer;
    });
    print("Edit Party: $id");
  }
}
